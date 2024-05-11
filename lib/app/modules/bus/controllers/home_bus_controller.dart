import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:mobility/app/models/bus/bus.dart';
import 'package:mobility/app/models/bus/bus_from_db.dart';

import '../../../constants/app string/app_string.dart';
import '../../../models/routes_model/data_model.dart';
import '../../../models/stop/stop.dart';
import '../../../repositories/busRepository/bus_repository_impl.dart';

class BusController extends GetxController {
  //home Bus
  final TextEditingController textEditingController = TextEditingController();

  BusRepositoryImpl busRepository = BusRepositoryImpl();
  RxBool isLoading = true.obs;
  List<BusFromDb> busList = <BusFromDb>[].obs;
  List<BusFromDb> availableBusList = <BusFromDb>[].obs;
  List<BusFromDb> searchBus = <BusFromDb>[].obs;
  RxInt? number = 0.obs;
  RxString sourceBus = " ".obs;
  RxString destinationBus = " ".obs;
  List<dynamic> routes = <Stop>[].obs;
  List<Stop> road = <Stop>[].obs;

  // second home Bus
  late StreamSubscription<Position> streamSubscription;
  GoogleMapController? mapController;
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  String apikey = "AIzaSyDSBWmU7p_y7wPfvZI98S6hypnDXT5aF34";

  var userLatitude = "5.3502292".obs, userLongitude = "-3.9881887".obs;
  var destLatitude = "5.3589712".obs, destLongitude = "-4.0272913".obs;
  // var userPosition = const LatLng(5.3502292, -3.9881887);
  LatLng second = const LatLng(5.354784, -3.974198);
  LatLng first = const LatLng(5.358065, -3.964597);
  LatLng destinationLocaton = const LatLng(5.351888, -3.983774);
  LatLng sourceLocation = const LatLng(5.3502292, -3.9881887);

  @override
  void onInit() async {
    super.onInit();
    // await busRepository.addRoadMap();
    await getBus();
    getLocation();
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

// home Bus
  Future<void> getBus() async {
    isLoading(true);
    busList = (await busRepository.getBusRoadMaps()).fold((l) => [], (r) => r);
    availableBusList = busList;

    isLoading(false);
    update();
  }

  Future<void> getBusByNumber(RxInt busNumber) async {
    searchBus = busList
        .where((bus) => bus.number.toString().contains(busNumber.toString()))
        .toList();
    availableBusList = searchBus;
    update();
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
      userLatitude = RxString("${position.latitude}");
      userLongitude = RxString("${position.longitude}");
      // getAddressFromLatLang(position);
    });
  }

  Future<List<dynamic>> getRoutes(List<Stop> source) async {
    Uri url = Uri.parse(
      "https://api.mapbox.com/directions/v5/mapbox/driving/${(source.map(
            (e) => "${e.long},${e.lat}",
          ).join(";"))}?steps=true&geometries=geojson&access_token=${AppString.pkkeyMapBox}",
    );
    final response = await get(url);
    final result = jsonDecode(response.body);
    final routes = DataModel.fromJson(result);
    // final distance =
    //     routes.routes?.expand((route) => route.legs ?? []).toList() ?? [];
    final formattedCoordinates = routes.routes
            ?.expand((route) => route.geometry?.coordinates ?? [])
            .toList() ??
        [];
    print("routes : $formattedCoordinates");

    return formattedCoordinates;
  }

  // https://api.mapbox.com/geocoding/v5/mapbox.places/universit.json?country=ci&proximity=-73.990593%2C40.740121&language=fr&access_token=pk.eyJ1Ijoic2Fja29iYSIsImEiOiJjbG1jcGFycnkwZ2gzM2psa2RqYW54OTAxIn0.7A-Ln_rc9SjCsWKN20e9yQ
  // https://api.mapbox.com/search/searchbox/v1/suggest?q=abidjan&language=fr&session_token=08b5f1a3-88f2-4291-88d7-f4e6a7c0f305&access_token=pk.eyJ1Ijoic2Fja29iYSIsImEiOiJjbHJjN2diZWgwc3lvMmlwaml6dnlhYjR6In0.r0ExoT7nKCOuFhCAIFEaPQ
}
