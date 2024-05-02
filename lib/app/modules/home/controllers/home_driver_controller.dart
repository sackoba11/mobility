import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;
import 'package:mobility/app/models/search/feature_collection_response.dart';

import '../../../constants/app string/app_string.dart';

class HomeDriverController extends GetxController {
  User? currentUser;
  late StreamSubscription<Position> streamSubscription;
  Position? localisation;
  RxBool isLoading = true.obs;
  TextEditingController textEditingController = TextEditingController();
  GoogleMapController? mapController;
  late mapbox.MapboxMap? mapboxController;
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    controller.moveCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
          target: LatLng(
            double.parse(originLatitude.value),
            double.parse(originLongitude.value),
          ),
          zoom: 15),
    ));
  }

  String apikey = "AIzaSyDSBWmU7p_y7wPfvZI98S6hypnDXT5aF34";

  var originLatitude = "5.3502292".obs, originLongitude = "-3.9881887".obs;
  var sourceLatitude = "".obs, sourceLongitude = "".obs;
  var destLatitude = " ".obs, destLongitude = "".obs;
  var userPosition = const LatLng(5.3502292, -3.9881887);

  @override
  void onInit() async {
    super.onInit();
    await getLocation();
    isLoading = RxBool(false);
  }

  @override
  void onReady() {
    super.onReady();
    getLocation();
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
    localisation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      originLatitude = RxString("${position.latitude}");
      originLongitude = RxString("${position.longitude}");
      userPosition = LatLng(double.parse(originLatitude.value),
          double.parse(originLongitude.value));
      print("coordonnées : ${originLatitude.value},${originLongitude.value}");
    });
  }

  Future<void> search(String location) async {
    Uri query = Uri.parse(
        "https://api.mapbox.com/geocoding/v5/mapbox.places/$location.json?country=ci&proximity=${originLongitude.value}%2C${originLatitude.value}&access_token=${AppString.pkkeyMapBox}");
    // "https://api.mapbox.com/search/searchbox/v1/suggest?q=$location+&language=fr&country=ci&proximity=-73.990593,40.740121&session_token=0df446cf-5d9c-41c1-88de-10c9ebf0085c&access_token=${AppString.pkkeyMapBox}");
    final response = await get(query);
    final result = jsonDecode(response.body);
    final search = FeatureCollectionResponse.fromJson(result);
    // var suggestions = search.suggestions.map((e) => e.name);
    print("resultat de la requet  ${search.features}");
  }
}
