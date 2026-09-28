import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobility/utils/error/app_error.dart';
import 'package:mobility/models/gare/gare.dart';
import 'package:mobility/models/gare_location/gare_location.dart';
import 'package:mobility/models/itineraire_gare/itineraire_gare.dart';
import 'package:mobility/models/transport_type.dart';
import '../../../services/routing/route_provider.dart';
import '../../../common/help_functions/help_functions.dart';
import '../../../common/map/fm_widgets.dart';
import '../../../data/repositories/OtherCarRepository/i_other_car_repository.dart';
import '../../../data/repositories/OtherCarRepository/other_car_repository_impl.dart';

class OtherCarController extends GetxController {
  IOtherCarRepository otherCarRepositoryImpl = OtherCarRepositoryImpl();
  RxBool filterGbaka = false.obs;
  RxBool filterTaxi = false.obs;
  RxList<Gare> gares = <Gare>[].obs;
  RxList<Gare> availableGare = <Gare>[].obs;
  RxList<ItineraireGare> availableItinerary = <ItineraireGare>[].obs;
  RxList<ItineraireGare> itineraries = <ItineraireGare>[].obs;
  RxBool isLoading = true.obs;
  Rx<Gare> gare = Gare(
          commune: "",
          location: GareLocation(lat: 5.3502292, long: -3.9881887),
          name: "",
          type: TransportType.unknown)
      .obs;
  Rx<ItineraireGare> itinerary = ItineraireGare(
    source: Gare(
      name: "Abobo Gare Mairie",
      commune: "Abobo",
      type: TransportType.gbaka,
      location: GareLocation(
        label: "teste",
        lat: 5.3502292,
        long: -3.9881887,
      ),
    ),
    destination: Gare(
      name: "Kennedy Marché",
      commune: "Abobo",
      type: TransportType.gbaka,
      location: GareLocation(
        label: "teste",
        lat: 5.3502292,
        long: -3.9881887,
      ),
    ),
    commune: "Abobo",
    type: TransportType.taxi,
  ).obs;
  TextEditingController textEdittingSearch = TextEditingController();
  var userLatitude = "5.3502292".obs, userLongitude = "-3.9881887".obs;
  RxList routes = [].obs;
  final RxString errorMessage = "".obs;

  @override
  void onInit() async {
    super.onInit();
    getLocation();
    availableGare.value = (await getGares()).fold((l) => [], (r) => r);
    availableItinerary.value = (await getItinerary()).fold((l) => [], (r) => r);
  }

  @override
  void onClose() {
    try {
      streamSubscription.cancel();
    } catch (_) {}
    textEdittingSearch.dispose();
    try {
      secondMapController.dispose();
    } catch (_) {}
    try {
      detailMapController.dispose();
    } catch (_) {}
    super.onClose();
  }

 

  late StreamSubscription<Position> streamSubscription;

  /// Un MapController PAR carte (même raison que côté bus).
  final MapController secondMapController = MapController();
  final MapController detailMapController = MapController();

  /// Dernier cadrage par carte : évite de rejouer un fit à chaque rebuild
  /// et de casser le zoom manuel de l'utilisateur.
  List<LatLng>? _lastFitSecond;
  List<LatLng>? _lastFitDetail;

  static bool _sameFit(List<LatLng>? prev, List<LatLng> next) {
    if (prev == null || prev.length != next.length) return false;
    for (var i = 0; i < next.length; i++) {
      if ((next[i].latitude - prev[i].latitude).abs() > 0.0027 ||
          (next[i].longitude - prev[i].longitude).abs() > 0.0027) {
        return false;
      }
    }
    return true;
  }

  void _fitOn(MapController ctrl, List<LatLng> points, List<LatLng>? last,
      void Function() save) {
    if (_sameFit(last, points)) return;
    save();
    fitWhenReady(ctrl, points);
  }

  /// Cadre SecondHome (départ + arrivée + utilisateur).
  void fitSecondOnPoints(List<LatLng> points) => _fitOn(
        secondMapController,
        points,
        _lastFitSecond,
        () => _lastFitSecond = List.of(points),
      );

  /// Cadre le détail (gare + utilisateur + tracé éventuel).
  void fitDetailOnPoints(List<LatLng> points) => _fitOn(
        detailMapController,
        points,
        _lastFitDetail,
        () => _lastFitDetail = List.of(points),
      );

  /// Force le recadrage au prochain appel (nouvelle gare recherchée).
  void resetFits() {
    _lastFitSecond = null;
    _lastFitDetail = null;
  }

  LatLng get userLatLng => LatLng(
        double.tryParse(userLatitude.value) ?? 5.3502292,
        double.tryParse(userLongitude.value) ?? -3.9881887,
      );

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
      errorMessage.value = "";
      final result = await otherCarRepositoryImpl.getAllItinerary();
      result.fold(
        (l) {
          errorMessage.value = l.userMessage;
          itineraries.value = [];
          HelpFunctions.customSnackbar(
            title: 'Erreur',
            message: l.userMessage,
            colorText: Colors.red,
            icon: Icons.error_outline,
          );
        },
        (r) => itineraries.value = r,
      );
      isLoading(false);
      return right(itineraries);
    } catch (e) {
      return left(GenericAppError("erreur:$e"));
    }
  }

  Future<List<ItineraireGare>> searchItinerary(String search) async {
    final query = search.toLowerCase();
    var searchitinerary = itineraries
        .where((itinerary) =>
            itinerary.source.name.toLowerCase().contains(query) ||
            itinerary.destination.name.toLowerCase().contains(query))
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
      userLatitude.value = "${position.latitude}";
      userLongitude.value = "${position.longitude}";
    });
  }

  /// Trajet position -> gare SANS Mapbox : OSRM gratuit, sinon ligne droite.
  Future<List<dynamic>> getRoutes(GareLocation source) async {
    try {
      final userLng =
          double.tryParse(userLongitude.value) ?? source.long;
      final userLat =
          double.tryParse(userLatitude.value) ?? source.lat;
      final osrm = await RouteProvider.osrmRoute([
        [userLng, userLat],
        [source.long, source.lat],
      ]);
      if (osrm.length >= 2) return osrm;
      return [
        [userLng, userLat],
        [source.long, source.lat],
      ];
    } catch (_) {
      return [];
    }
  }
}
