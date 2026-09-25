import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobility/data/repositories/driverRepository/driver_repository_impl.dart';
import 'package:mobility/data/repositories/driverRepository/i_driver_repository.dart';
import 'package:mobility/models/bus/bus_from_firestore/bus.dart';
import 'package:mobility/services/driver_tracking/driver_session_store.dart';
import 'package:mobility/services/driver_tracking/driver_tracking_service.dart';

/// Onglet Service chauffeur : état du service en cours + actions.
/// Lit la session persistée (robuste à la fermeture de l'app).
/// Enregistré en PERMANENT : c'est la source réactive unique — chaque
/// mutation (activation/arrêt/restauration) notifie instantanément tous
/// les écrans (liste bus, fiche, onglet Service).
class ServiceTabController extends GetxController {
  IDriverRepository repository = DriverRepositoryImpl();
  final RxBool isLoading = true.obs;
  final Rxn<Bus> bus = Rxn<Bus>();
  final RxInt busNumber = (-1).obs;
  final RxString idBus = ''.obs;
  final RxString lastError = ''.obs;

  /// Position live du chauffeur pour la carte de l'onglet.
  final RxString userLat = '5.3502292'.obs;
  final RxString userLng = '-3.9881887'.obs;

  /// Heure du dernier fix GPS (témoin de fraîcheur affiché sous la carte).
  final RxString lastFixAt = ''.obs;

  StreamSubscription<Position>? _posSub;
  final MapController mapController = MapController();

  /// Suivi caméra (comme côté passager), avec zone morte anti-gestes.
  /// Post-frame : interdit pendant un build.
  LatLng? lastFollowedPos;

  void followDriverPosition(LatLng target) {
    final last = lastFollowedPos;
    if (last != null &&
        (target.latitude - last.latitude).abs() < 0.0002 &&
        (target.longitude - last.longitude).abs() < 0.0002) {
      return;
    }
    lastFollowedPos = target;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        mapController.move(target, mapController.camera.zoom);
      } catch (_) {}
    });
  }

  @override
  void onInit() {
    super.onInit();
    load();
  }

  @override
  void onClose() {
    try {
      _posSub?.cancel();
    } catch (_) {}
    mapController.dispose();
    super.onClose();
  }

  /// Flux position (best-effort : la carte affiche les arrêts même sans GPS).
  Future<void> _trackPosition() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) return;
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }
      await _stopPositionStream();
      _posSub = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 5,
        ),
      ).listen((p) {
        userLat.value = '${p.latitude}';
        userLng.value = '${p.longitude}';
        final now = DateTime.now();
        lastFixAt.value =
            '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
      });
    } catch (_) {}
  }

  /// Synchro légère (sans réseau) depuis la session persistée.
  /// Appelée par DriverController après chaque mutation.
  void syncFromSession() {
    final session = DriverSessionStore.read();
    final number = session?['busNumber'];
    final id = session?['idBus']?.toString() ?? '';
    if (number is! int || id.isEmpty) {
      busNumber.value = -1;
      idBus.value = '';
    } else {
      busNumber.value = number;
      idBus.value = id;
    }
  }

  Future<void> load() async {
    isLoading.value = true;
    lastError.value = '';
    syncFromSession();
    if (!hasService) {
      bus.value = null;
      await _stopPositionStream();
      isLoading.value = false;
      return;
    }
    final number = busNumber.value;
    final result = await repository.getAllBus();
    result.fold(
      (l) => lastError.value = l.userMessage,
      (list) {
        try {
          bus.value = list.firstWhere((b) => b.number == number);
        } catch (_) {
          bus.value = null;
        }
      },
    );
    if (bus.value != null) {
      await _trackPosition();
    }
    isLoading.value = false;
  }

  Future<void> _stopPositionStream() async {
    try {
      await _posSub?.cancel();
    } catch (_) {}
    _posSub = null;
  }

  bool get hasService => busNumber.value != -1;

  Future<void> stopService() async {
    final number = busNumber.value;
    final id = idBus.value;
    if (number != -1 && id.isNotEmpty) {
      await repository.deactivateBusService(busNumber: number, idBus: id);
    }
    await DriverTrackingService.stop();
    await DriverTrackingService.clearSession();
    await DriverSessionStore.clear();
    await load();
  }
}
