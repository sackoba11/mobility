import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/app/repositories/driverRepository/driver_repository_impl.dart';
import 'package:mobility/app/repositories/driverRepository/i_driver_repository.dart';

import '../../../models/bus/bus.dart';

class DriverController extends GetxController {
  IDriverRepository iDriverRepository = DriverRepositoryImpl();
  RxBool isActive = false.obs;
  RxInt? busNumber;
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
  GoogleMapController? mapController;
  Future<void> onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  @override
  void onInit() async {
    super.onInit();

    await getLocation();
  }

  @override
  void onReady() async {
    super.onReady();
    await getLocation();
  }

  @override
  void onClose() {
    super.onClose();
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

  Future<String> activeBusService(Bus bus, Position positionBus) async {
    try {
      var result = (await iDriverRepository.activateBusService(
              bus: bus, position: positionBus))
          .fold((l) => null, (r) => r);
      return result!;
    } catch (e) {
      return "Echec";
    }
  }

  Future<bool> deactiveBusService(int busNumber, String idBus) async {
    try {
      (await iDriverRepository.deactivateBusService(
          busNumber: busNumber, idBus: idBus));
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
