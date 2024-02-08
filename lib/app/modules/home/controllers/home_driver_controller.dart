import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;

class HomeDriverController extends GetxController {
  late StreamSubscription<Position> streamSubscription;
  Position? localisation;
  RxBool isLoading = true.obs;
  GoogleMapController? mapController;
  late mapbox.MapboxMap? mapboxController;
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  String apikey = "AIzaSyDSBWmU7p_y7wPfvZI98S6hypnDXT5aF34";

  var originLatitude = "5.3502292".obs, originLongitude = "-3.9881887".obs;
  var destLatitude = "5.3589712", destLongitude = "-4.0272913";
  var userPosition = const LatLng(5.3502292, -3.9881887);

  LatLng destinationLocaton = LatLng(5.3502292, -3.9881887);
  LatLng sourceLocation = LatLng(5.3589712, -4.0272913);
  List<LatLng> polylineCoordinates = [];

  @override
  void onInit() async {
    await getLocation();
    super.onInit();
    isLoading = RxBool(false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void _addMarker(LatLng pos){

//   if(controller.origin == null || (controller.origin !=null && controller.destination  != null)){
//     Obx(() => controller.origin=Marker(
//       markerId: const InfoWindow(title: "origin"),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//       position: pos
//     ))
//   }
// }

  // void getPolyPoints() async {
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     apikey,
  //     PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
  //     PointLatLng(destinationLocaton.latitude, destinationLocaton.longitude),
  //     // travelMode: TravelMode.driving,
  //   );
  //   // wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]);
  //   // print("result de  ${result.points}");
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //       print("polilnecoordonnées $polylineCoordinates");

  //     });
  //   }
  // }

  // Future<String> showGoogleAutoComplete() async {
  //   var kGoogleApiKey = apikey;

  //   Prediction? p = await PlacesAutocomplete(
  //       offset: 0,
  //       radius: 1000,
  //       strictbounds: false,
  //       region: "us",
  //       context: context,
  //       apiKey: kGoogleApiKey,
  //       mode: Mode.overlay, // Mode.fullscreen
  //       language: "en",
  //       components: [Component(Component.country, "en")],
  //       types: ["(cities)"],
  //       hint: "Search City");

  //   return p!.description!;
  // }
  // String place =
  //                                       await showGoogleAutoComplete();
  //                                   sourcecontroller.text = place;

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
      // print(userPosition);
      // print(originLatitude);
      // print(originLongitude);
    });
  }
}
