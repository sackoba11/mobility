import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobility/data/repositories/driverRepository/driver_repository_impl.dart';
import 'package:mobility/data/repositories/driverRepository/i_driver_repository.dart';
import 'package:mobility/services/driver_tracking/driver_session_store.dart';
import 'package:mobility/services/driver_tracking/driver_tracking_service.dart';

import '../../../models/bus/bus_from_firestore/bus.dart';
import 'service_tab_controller.dart';

/// État de mise en service d'un bus (Phase robustesse) :
/// - session persistée localement (survit à la fermeture de l'app),
/// - heartbeat `lastSeen` à chaque position (les passagers ignorent les
///   bus périmés, fini les fantômes),
/// - foreground service Android (positions même app en arrière-plan).
class DriverController extends GetxController {
  IDriverRepository iDriverRepository = DriverRepositoryImpl();
  RxBool isActive = false.obs;
  final RxString lastError = "".obs;
  final RxString activeBusLabel = "".obs;
  // Numéro du bus en service (-1 = aucun). Objet stable : on ne modifie
  // que .value pour que les Obx soient toujours notifiés (bascule 610->21
  // incluse, où isActive reste à true).
  final RxInt activeBusNumber = (-1).obs;
  RxString idBusController = "".obs;
  Rx<Position> positionBus = Position(
          longitude: -3.9881887,
          latitude: 5.3502292,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          altitudeAccuracy: 0,
          heading: 0,
          headingAccuracy: 0,
          speed: 0,
          speedAccuracy: 0)
      .obs;

  var userLatitude = "5.3502292".obs, userLongitude = "-3.9881887".obs;

  late StreamSubscription<Position> streamSubscription;
  final MapController mapController = MapController();

  @override
  void onInit() async {
    super.onInit();
    FlutterForegroundTask.addTaskDataCallback(_onTaskData);
    await getLocation();
    await restoreSession();
  }

  @override
  void onReady() async {
    super.onReady();
    await getLocation();
  }

  @override
  void onClose() {
    try {
      streamSubscription.cancel();
    } catch (_) {}
    mapController.dispose();
    serviceTimer?.cancel();
    FlutterForegroundTask.removeTaskDataCallback(_onTaskData);
    super.onClose();
  }

  Timer? serviceTimer;

  /// Dernière position suivie par la caméra (même logique que le passager).
  LatLng? lastFollowedPos;

  /// Centre la caméra sur le chauffeur (= le bus), sans lutter contre
  /// les gestes (zone morte ~20 m). Post-frame : interdit pendant un build.
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

  void _onTaskData(Object data) {
    // Bouton "Arrêter" de la notification du foreground service.
    if (data is Map && data['action'] == 'stop_service') {
      stopTracking();
    }
  }

  /// Notifie la source réactive unique (tous les écrans chauffeur).
  void _syncServiceState() {
    if (Get.isRegistered<ServiceTabController>()) {
      Get.find<ServiceTabController>().syncFromSession();
    }
  }

  /// Restaure un service interrompu par la fermeture de l'app.
  /// Session périmée -> clôture distante (best-effort) + reset local.
  Future<void> restoreSession() async {
    final session = DriverSessionStore.read();
    if (session == null) return;
    final idBus = session['idBus']?.toString() ?? '';
    final number = session['busNumber'];
    if (idBus.isEmpty || number is! int) {
      await DriverSessionStore.clear();
      return;
    }
    if (DriverSessionStore.isStale(session)) {
      await iDriverRepository.deactivateBusService(
          busNumber: number, idBus: idBus);
      await DriverSessionStore.clear();
      await DriverTrackingService.stop();
      _syncServiceState();
      lastError.value =
          "Ancien service clôturé automatiquement (inactif depuis trop longtemps).";
      return;
    }
    activeBusNumber.value = number;
    idBusController.value = idBus;
    activeBusLabel.value =
        "${session['busSource'] ?? ''} ↔ ${session['busDestination'] ?? ''}";
    isActive.value = true;
    _syncServiceState();
    _startHeartbeat(number, idBus);
    _startForeground(number);
  }

  Future<void> getLocation() async {
    bool serviceEnabled;

    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      positionBus.value = position;
      userLatitude.value = "${position.latitude}";
      userLongitude.value = "${position.longitude}";
    });
  }

  String get _uid => FirebaseAuth.instance.currentUser?.uid ?? '';

  /// Démarre un service : écriture initiale + session + foreground + heartbeat.
  /// Si un autre service était actif, il est clôturé d'abord.
  Future<String> startTracking(Bus bus) async {
    lastError.value = "";
    if (_uid.isEmpty) {
      lastError.value = "Session expirée, reconnectez-vous.";
      return "Echec";
    }
    // Bascule propre : clôturer l'ancien service éventuel.
    await _closePreviousSession();

    final result = await iDriverRepository.activateBusService(
        bus: bus, position: positionBus.value, driverUid: _uid);
    return result.fold(
      (l) {
        lastError.value = l.userMessage;
        isActive.value = false;
        _syncServiceState();
        return "Echec";
      },
      (idBus) async {
        if (idBus.isEmpty) {
          isActive.value = false;
          _syncServiceState();
          return "Echec";
        }
        // Objet stable : notifie même quand isActive est déjà à true.
        activeBusNumber.value = bus.number;
        idBusController.value = idBus;
        activeBusLabel.value = "${bus.source} ↔ ${bus.destination}";
        isActive.value = true;
        await DriverSessionStore.save(
          busNumber: bus.number,
          idBus: idBus,
          busSource: bus.source,
          busDestination: bus.destination,
        );
        await DriverTrackingService.saveSession({
          'busNumber': bus.number,
          'idBus': idBus,
          'driverUid': _uid,
        });
        _syncServiceState();
        _startHeartbeat(bus.number, idBus);
        await _startForeground(bus.number);
        return idBus;
      },
    );
  }

  Future<void> _closePreviousSession() async {
    final session = DriverSessionStore.read();
    if (session == null) return;
    final number = session['busNumber'];
    final idBus = session['idBus']?.toString() ?? '';
    if (number is int && idBus.isNotEmpty) {
      await iDriverRepository.deactivateBusService(
          busNumber: number, idBus: idBus);
    }
    await DriverSessionStore.clear();
    await DriverTrackingService.clearSession();
    serviceTimer?.cancel();
    await DriverTrackingService.stop();
  }

  /// Arrête le service courant (foreground + distant + local).
  Future<bool> stopTracking() async {
    final number = activeBusNumber.value;
    final idBus = idBusController.value;
    activeBusNumber.value = -1;
    isActive.value = false;
    serviceTimer?.cancel();
    await DriverTrackingService.stop();
    await DriverTrackingService.clearSession();
    await DriverSessionStore.clear();
    _syncServiceState();
    if (number != -1 && idBus.isNotEmpty) {
      await iDriverRepository.deactivateBusService(
          busNumber: number, idBus: idBus);
    }
    idBusController.value = "";
    activeBusLabel.value = "";
    return true;
  }

  void _startHeartbeat(int number, String idBus) {
    serviceTimer?.cancel();
    serviceTimer =
        Timer.periodic(const Duration(seconds: 15), (_) async {
      final lat = double.tryParse(userLatitude.value);
      final lng = double.tryParse(userLongitude.value);
      if (lat == null || lng == null) return;
      final ok = await updateBusService(number, idBus, lat, lng);
      if (ok) await DriverSessionStore.touchHeartbeat();
    });
  }

  Future<void> _startForeground(int number) async {
    try {
      DriverTrackingService.ensureInitialized();
      final granted =
          await DriverTrackingService.requestPermissions();
      if (!granted) {
        lastError.value =
            "Notifications refusées : suivi en arrière-plan désactivé.";
        return;
      }
      await DriverTrackingService.start(busNumber: number);
    } catch (e) {
      // Localisation d'arrière-plan refusée : guider vers les réglages.
      lastError.value =
          "Activez la localisation « Toujours autoriser » pour le suivi en arrière-plan.";
      try {
        await Geolocator.openAppSettings();
      } catch (_) {}
    }
  }

  // --- API conservée pour compatibilité ---

  Future<String> activeBusService(Bus bus, Position position) =>
      startTracking(bus);

  Future<bool> deactiveBusService(int busNumber, String idBus) async {
    if (isActive.value &&
        activeBusNumber.value == busNumber &&
        idBusController.value == idBus) {
      return stopTracking();
    }
    try {
      await iDriverRepository.deactivateBusService(
          busNumber: busNumber, idBus: idBus);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateBusService(
      int busNumber, String idBus, double lat, double long) async {
    try {
      (await iDriverRepository.updatePosition(
          busNumber: busNumber, idBus: idBus, lat: lat, long: long));
      return true;
    } catch (e) {
      return false;
    }
  }
}
