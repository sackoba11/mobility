import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverController extends GetxController {
  RxBool isActive = false.obs;
  RxInt? busNumber;
  late StreamSubscription<Position> streamSubscription;
  GoogleMapController? mapController;
  Future<void> onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  String apikey = "AIzaSyDSBWmU7p_y7wPfvZI98S6hypnDXT5aF34";

  var userLatitude = "5.3502292".obs, userLongitude = "-3.9881887".obs;

  @override
  void onInit() async {
    super.onInit();

    await getLocation();

    await onMapCreated(mapController!);
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
      userLatitude.value = "${position.latitude}";
      userLongitude.value = "${position.longitude}";
      // getAddressFromLatLang(position);
    });
  }
}
