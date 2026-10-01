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

  /// Nombre d'arrêts au catalogue (compteur dashboard).
  int get stopsCount => stops.length;

  /// Arrêts les plus proches (aperçu dashboard, nulls en dernier).
  List<TransitStop> nearestStops({int limit = 5}) {
    final list = stops.toList();
    list.sort((a, b) {
      final da = distanceTo(a);
      final db = distanceTo(b);
      if (da == null && db == null) {
        return a.name.compareTo(b.name);
      }
      if (da == null) return 1;
      if (db == null) return -1;
      return da.compareTo(db);
    });
    return list.take(limit).toList();
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

  /// Bus desservant [stop] :
  /// 1. `stopIds` (rattachement exact, scripts/import-bus/enrich),
  /// 2. match osmId dans la roadMap (docs enrichis sans stopIds),
  /// 3. proximité <= 100 m (utile avant enrichissement complet).
  List<BusFromDb> busesThrough(TransitStop stop) {
    if (!Get.isRegistered<BusController>()) return [];
    final bus = Get.find<BusController>();
    final all = [...bus.activeBusList, ...bus.listAllBus];
    final seen = <String>{};
    final result = <BusFromDb>[];
    for (final b in all) {
      // Variante incluse : deux variantes d'une même ligne ne se
      // dédupliquent pas entre elles.
      final key =
          '${b.number}_${b.direction}_${b.variantIndex}_${b.driverUid}';
      if (!seen.add(key)) continue;
      // 1. Rattachement exact (stopIds enrichis).
      var matches = b.stopIds.contains(stop.osmId);
      // 2. Match osmId dans la roadMap (anciens docs enrichis).
      matches = matches ||
          b.roadMap.any((s) =>
              s.osmId != null &&
              (s.osmId == stop.osmId ||
                  s.osmId?.replaceAll('/', '_') == stop.osmId));
      // 3. Proximité (avant enrichissement).
      matches = matches ||
          b.roadMap.any((s) =>
              Geolocator.distanceBetween(
                  s.lat, s.long, stop.lat, stop.lng) <=
              _matchRadiusMeters);
      if (matches) result.add(b);
    }
    result.sort((a, b) {
      final byNumber = a.number.compareTo(b.number);
      if (byNumber != 0) return byNumber;
      final byDir = a.direction.compareTo(b.direction);
      if (byDir != 0) return byDir;
      return a.variantIndex.compareTo(b.variantIndex);
    });
    return result;
  }

  /// Bus en service passant par [stop] ("Bus en approche").
  List<BusFromDb> approachingBuses(TransitStop stop) =>
      busesThrough(stop).where((b) => b.isActive).toList();

  /// Variantes de lignes desservant [stop] (live ou non, dédupliquées),
  /// triées par numéro, sens puis variante ("Lignes de desserte (N)").
  List<BusFromDb> servingLines(TransitStop stop) {
    final seen = <String>{};
    final lines = <BusFromDb>[];
    for (final b in busesThrough(stop)) {
      if (seen.add(
          '${b.number}_${b.direction}_${b.variantIndex}')) {
        lines.add(b);
      }
    }
    lines.sort((a, b) {
      final n = a.number.compareTo(b.number);
      if (n != 0) return n;
      final d = a.direction.compareTo(b.direction);
      if (d != 0) return d;
      return a.variantIndex.compareTo(b.variantIndex);
    });
    return lines;
  }
}
