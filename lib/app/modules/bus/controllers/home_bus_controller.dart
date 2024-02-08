import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';

import '../../../constants/app string/app_string.dart';
import '../../../models/routes_model/data_model.dart';
import '../../../repositories/BusRepository/bus_repository_impl.dart';

class BusController extends GetxController {
  //home Bus
  final TextEditingController textEditingController = TextEditingController();

  BusRepositoryImpl busRepository = BusRepositoryImpl();
  RxBool isLoading = true.obs;
  List<QueryDocumentSnapshot<Object?>> busList =
      <QueryDocumentSnapshot<Object?>>[].obs;
  List<QueryDocumentSnapshot<Object?>> availableBusList =
      <QueryDocumentSnapshot<Object?>>[].obs;
  List<QueryDocumentSnapshot<Object?>> searchBus =
      <QueryDocumentSnapshot<Object?>>[].obs;
  RxInt? number = 0.obs;
  RxString sourceBus = " ".obs;
  RxString destinationBus = " ".obs;
  List<dynamic> routes = [].obs;
  List<dynamic> road = [].obs;

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

  List<LatLng> polylineCoordinates = const [
    LatLng(5.3502292, -3.9881887),
    LatLng(5.350667, -3.988207),
    LatLng(5.351888, -3.983774),
    LatLng(5.353108, -3.979858),
    LatLng(5.353845, -3.977656),
    LatLng(5.354784, -3.974198),
    LatLng(5.356915, -3.967548),
    LatLng(5.358065, -3.964597),
    LatLng(5.360552, -3.965393),
    LatLng(5.362438, -3.966146),
    LatLng(5.362040, -3.967070)
  ].obs;

  @override
  void onInit() async {
    super.onInit();
    // await busRepository.addRoadMap();
    await getBus();
    getLocation();
    // routes = await getRoutes(
    //     [LatLng(5.3502292, -3.9881887), LatLng(5.362040, -3.967070)]);

    // print("Liste de routes $road");
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
        .where((bus) => bus["number"].toString().contains(busNumber.toString()))
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

//   void _addMarker(LatLng pos){

//   if(controller.origin == null || (controller.origin !=null && controller.destination  != null)){
//     Obx(() => controller.origin=Marker(
//       markerId: const InfoWindow(title: "origin"),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//       position: pos
//     ))
//   }
// }

  Future<List<dynamic>> getRoutes(List<dynamic> source) async {
    Uri url = Uri.parse(
      "https://api.mapbox.com/directions/v5/mapbox/driving/${(source.map(
            (e) => "${e["long"]},${e["lat"]}",
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
    // print("la distance entre les deux points est : $distance");
    // print("routes : $formattedCoordinates");
    print(result);
    return formattedCoordinates;
  }

  // https://api.mapbox.com/geocoding/v5/mapbox.places/universit.json?country=ci&proximity=-73.990593%2C40.740121&language=fr&access_token=pk.eyJ1Ijoic2Fja29iYSIsImEiOiJjbG1jcGFycnkwZ2gzM2psa2RqYW54OTAxIn0.7A-Ln_rc9SjCsWKN20e9yQ
  // https://api.mapbox.com/search/searchbox/v1/suggest?q=abidjan&language=fr&session_token=08b5f1a3-88f2-4291-88d7-f4e6a7c0f305&access_token=pk.eyJ1Ijoic2Fja29iYSIsImEiOiJjbHJjN2diZWgwc3lvMmlwaml6dnlhYjR6In0.r0ExoT7nKCOuFhCAIFEaPQ
}
