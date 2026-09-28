import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mobility/common/help_functions/help_functions.dart';
import 'package:mobility/data/repositories/StopRepository/i_stop_repository.dart';
import 'package:mobility/data/repositories/StopRepository/stop_repository_impl.dart';
import 'package:mobility/models/bus/bus_from_realTime/bus_from_db.dart';
import 'package:mobility/models/transit_stop/transit_stop.dart';
import 'package:mobility/views/bus/controllers/home_bus_controller.dart';

/// Section Arrêts (partie Bus) : catalogue, proximité, recherche,
/// et bus passant par un arrêt sélectionné.
class StopsController extends GetxController {
  IStopRepository repository = StopRepositoryImpl();

  final TextEditingController searchController = TextEditingController();
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;
  final RxString kindFilter = 'all'.obs; // all | stop | gare | boat

  RxList<TransitStop> stops = <TransitStop>[].obs;
  RxList<TransitStop> visible = <TransitStop>[].obs;
  final Rxn<TransitStop> selected = Rxn<TransitStop>();

  /// Clé du dernier arrêt déjà cadré sur la carte détail : évite de
  /// rejouer un fit à chaque rebuild (qui casserait le zoom manuel).
  String? lastFittedStopKey;

  static const double _matchRadiusMeters = 100;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> load() async {
    isLoading(true);
    errorMessage.value = '';
    final result = await repository.getAllStops();
    result.fold(
      (l) {
        errorMessage.value = l.userMessage;
        stops.clear();
      },
      (r) => stops.assignAll(r),
    );
    applyFilters();
    isLoading(false);
    if (errorMessage.value.isNotEmpty) {
      HelpFunctions.customSnackbar(
        title: 'Erreur',
        message: errorMessage.value,
        colorText: Colors.red,
        icon: Icons.error_outline,
      );
    }
  }

  /// Position passager si connue (via le controller bus partagé).
  (double, double)? get _userPos {
    if (!Get.isRegistered<BusController>()) return null;
    final bus = Get.find<BusController>();
    final lat = double.tryParse(bus.userLatitude.value);
    final lng = double.tryParse(bus.userLongitude.value);
    if (lat == null || lng == null) return null;
    return (lat, lng);
  }

  double? distanceTo(TransitStop stop) {
    final pos = _userPos;
    if (pos == null) return null;
    return Geolocator.distanceBetween(pos.$1, pos.$2, stop.lat, stop.lng);
  }

  static String formatDistance(double meters) {
    if (meters < 1000) return 'à ${meters.round()} m';
    return 'à ${(meters / 1000).toStringAsFixed(1)} km';
  }

  void applyFilters() {
    final query = searchController.text.trim().toLowerCase();
    final kind = kindFilter.value;
    final pos = _userPos;
    final filtered = stops.where((s) {
      if (kind != 'all' && s.kind != kind) return false;
      if (query.isNotEmpty &&
          !s.name.toLowerCase().contains(query)) {
        return false;
      }
      return true;
    }).toList();
    // Proximité d'abord quand la position est connue.
    if (pos != null) {
      filtered.sort((a, b) => Geolocator.distanceBetween(
              pos.$1, pos.$2, a.lat, a.lng)
          .compareTo(Geolocator.distanceBetween(
              pos.$1, pos.$2, b.lat, b.lng)));
    } else {
      filtered.sort((a, b) => a.name.compareTo(b.name));
    }
    visible.assignAll(filtered);
  }

  void setKind(String kind) {
    kindFilter.value = kind;
    applyFilters();
  }

  void onSearchChanged(String _) => applyFilters();

  /// Bus desservant [stop] : match osmId, sinon proximité <= 100 m
  /// (utile avant enrichissement complet des roadMap).
  List<BusFromDb> busesThrough(TransitStop stop) {
    if (!Get.isRegistered<BusController>()) return [];
    final bus = Get.find<BusController>();
    final all = [...bus.activeBusList, ...bus.listAllBus];
    final seen = <String>{};
    final result = <BusFromDb>[];
    for (final b in all) {
      final key = '${b.number}_${b.driverUid}';
      if (!seen.add(key)) continue;
      var matches = b.roadMap.any((s) =>
          s.osmId != null &&
          (s.osmId == stop.osmId ||
              s.osmId?.replaceAll('/', '_') == stop.osmId));
      matches = matches ||
          b.roadMap.any((s) =>
              Geolocator.distanceBetween(
                  s.lat, s.long, stop.lat, stop.lng) <=
              _matchRadiusMeters);
      if (matches) result.add(b);
    }
    result.sort((a, b) => a.number.compareTo(b.number));
    return result;
  }
}
