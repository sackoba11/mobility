import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:mobility/app/error/app_error.dart';
import 'package:mobility/app/models/gare/gare.dart';
import 'package:mobility/app/models/itineraire_gare/itineraire_gare.dart';
import '../../../constants/app string/app_string.dart';
import '../../../models/routes_model/data_model.dart';
import '../../../repositories/otherCarRepository/i_other_car_repository.dart';
import '../../../repositories/otherCarRepository/other_car_repository_impl.dart';

class OtherCarController extends GetxController {
  IOtherCarRepository otherCarRepositoryImpl = OtherCarRepositoryImpl();
  RxBool filterGbaka = false.obs;
  RxBool filterTaxi = false.obs;
  RxList<Gare> gares = <Gare>[].obs;
  RxList<Gare> availableGare = <Gare>[].obs;
  RxList<ItineraireGare> availableItinerary = <ItineraireGare>[].obs;
  RxList<ItineraireGare> itineraries = <ItineraireGare>[].obs;
  RxBool isLoading = true.obs;
  Rx<Gare> gare = Gare(commune: "", location: {}, name: "", type: "").obs;
  Rx<ItineraireGare> itinerary = ItineraireGare(
    source: {
      "name": "Abobo Gare Mairie",
      "commune": "Abobo",
      "type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      }
    },
    destination: {
      "name": "Kennedy Marché",
      "commune": "Abobo",
      " type": "Gbaka",
      "location": {
        "label": "teste",
        "lat": 5.3502292,
        "long": -3.9881887,
      },
    },
    commune: "Abbobo",
    type: "Taxi",
  ).obs;
  TextEditingController textEdittingSearch = TextEditingController();
  var userLatitude = "5.3502292".obs, userLongitude = "-3.9881887".obs;
  var originLatitude = "5.3502292".obs, originLongitude = "-3.9881887".obs;
  var destLatitude = "5.3589712".obs, destLongitude = "-4.0272913".obs;
  LatLng second = const LatLng(5.354784, -3.974198);
  LatLng first = const LatLng(5.358065, -3.964597);
  LatLng destinationLocaton = const LatLng(5.351888, -3.983774);
  LatLng sourceLocation = const LatLng(5.3502292, -3.9881887);
  RxList routes = [].obs;

  @override
  void onInit() async {
    super.onInit();
    getLocation();
    availableGare.value = (await getGares()).fold((l) => [], (r) => r);
    availableItinerary.value = (await getItinerary()).fold((l) => [], (r) => r);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  late StreamSubscription<Position> streamSubscription;
  GoogleMapController? mapController;
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<Either<AppError, List<Gare>>> getGares() async {
    try {
      isLoading(true);
      gares.value = (await otherCarRepositoryImpl.getAllGares())
          .fold((l) => [], (r) => r);
      isLoading(false);
      return right(gares);
    } catch (e) {
      return left(GenericAppError("erreur:$e"));
    }
  }

  Future<Either<AppError, List<ItineraireGare>>> getItinerary() async {
    try {
      isLoading(true);
      itineraries.value = (await otherCarRepositoryImpl.getAllItinerary())
          .fold((l) => [], (r) => r);
      isLoading(false);
      return right(itineraries);
    } catch (e) {
      return left(GenericAppError("erreur:$e"));
    }
  }

  Future<List<ItineraireGare>> searchItinerary(String search) async {
    var searchitinerary = itineraries
        .where((itinerary) => itinerary.source["name"]
            .toLowerCase()
            .toString()
            .contains(search.toLowerCase().toString()))
        .toList();
    return searchitinerary;
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
    });
  }

  Future<List<dynamic>> getRoutes(source) async {
    Uri url = Uri.parse(
      "https://api.mapbox.com/directions/v5/mapbox/driving/${userLongitude.value},${userLatitude.value};${source["long"]},${source["lat"]}?steps=true&geometries=geojson&access_token=${AppString.pkkeyMapBox}",
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
    debugPrint(formattedCoordinates.toString());
    return formattedCoordinates;
  }

  List<LatLng> polylineCoordinates = const [];
}
