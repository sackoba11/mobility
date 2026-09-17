import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:mobility/models/bus/bus_from_firestore/bus.dart';

import '../../../common/help_functions/help_functions.dart';
import '../../../utils/constants/app string/app_string.dart';
import '../../../models/bus/bus_from_realTime/bus_from_db.dart';
import '../../../models/routes_model/data_model.dart';
import '../../../models/stop/stop.dart';
import '../../../data/repositories/BusRepository/bus_repository_impl.dart';

class BusController extends GetxController {
  //home Bus
  final TextEditingController textEditingController = TextEditingController();

  BusRepositoryImpl busRepository = BusRepositoryImpl();
  RxBool isLoading = true.obs;
  late final RxBool isConnect = false.obs;
  List<BusFromDb> activeBusList = <BusFromDb>[].obs;
  List<BusFromDb> availableActiveBusList = <BusFromDb>[].obs;
  List<BusFromDb> searchActiveBus = <BusFromDb>[].obs;
  List<BusFromDb> listAllBus = <BusFromDb>[].obs;
  List<Bus> searchListAllBus = <Bus>[].obs;

  List<dynamic> routes = <Stop>[].obs;
  Rx<BusFromDb> currentBus = BusFromDb(
          number: 0,
          source: "",
          destination: "",
          isActive: false,
          roadMap: [],
          position: Stop(lat: 0, long: 0),
          startDate: DateTime.now())
      .obs;

  // second home Bus
  late StreamSubscription<Position> streamSubscription;
  GoogleMapController? mapController;
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  var userLatitude = "5.3502292".obs, userLongitude = "-3.9881887".obs;
  Rx<LatLng> busPosition = const LatLng(5.3502292, -3.9881887).obs;

  @override
  void onInit() async {
    super.onInit();
    // await busRepository.addRoadMap();
    isConnect.value = await HelpFunctions.checkConnectivity();
    await getAllBus();
    getLocation();
  }

  @override
  void onReady() {
    super.onReady();
    getLocation();
  }

  @override
  void onClose() {
    try {
      streamSubscription.cancel();
    } catch (_) {}
    textEditingController.dispose();
    mapController?.dispose();
    super.onClose();
  }

// home Bus
  final RxString errorMessage = "".obs;

  Future<void> getAllBus() async {
    isLoading(true);
    errorMessage.value = "";
    final activeResult = await busRepository.getActiveBus();
    final allResult = await busRepository.getAllBus();

    activeResult.fold(
      (l) => errorMessage.value = l.userMessage,
      (r) => activeBusList = r,
    );
    allResult.fold(
      (l) => errorMessage.value = l.userMessage,
      (r) => listAllBus = r,
    );

    availableActiveBusList = activeBusList + listAllBus;

    isLoading(false);
    update();
    if (errorMessage.value.isNotEmpty) {
      HelpFunctions.customSnackbar(
        title: 'Erreur',
        message: errorMessage.value,
        colorText: Colors.red,
        icon: Icons.error_outline,
      );
    }
  }

  Future<void> getBusByNumber(int busNumber) async {
    searchActiveBus = (activeBusList + listAllBus)
        .where((bus) => bus.number.toString().contains(busNumber.toString()))
        .toList();
    availableActiveBusList = searchActiveBus;
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
      userLatitude.value = "${position.latitude}";
      userLongitude.value = "${position.longitude}";
      // getAddressFromLatLang(position);
    });
  }

  Future<List<dynamic>> getRoutes(List<Stop> source) async {
    try {
      if (source.isEmpty || !AppString.hasMapboxToken) return [];
      Uri url = Uri.parse(
        "https://api.mapbox.com/directions/v5/mapbox/driving/${(source.map(
              (e) => "${e.long},${e.lat}",
            ).join(";"))}?steps=true&geometries=geojson&access_token=${AppString.pkkeyMapBox}",
      );
      final response = await get(url);
      if (response.statusCode != 200) return [];
      final result = jsonDecode(response.body);
      final routes = DataModel.fromJson(result);
      final formattedCoordinates = routes.routes
              ?.expand((route) => route.geometry?.coordinates ?? [])
              .toList() ??
          [];

      return formattedCoordinates;
    } catch (_) {
      return [];
    }
  }
}
