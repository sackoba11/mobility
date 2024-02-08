import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverController extends GetxController {
  late StreamSubscription<Position> streamSubscription;
  GoogleMapController? mapController;
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  String apikey = "AIzaSyDSBWmU7p_y7wPfvZI98S6hypnDXT5aF34";

  var originLatitude = "5.3502292".obs, originLongitude = "-3.9881887".obs;
  var destLatitude = "5.3589712".obs, destLongitude = "-4.0272913".obs;

  LatLng destinationLocaton = const LatLng(5.362040, -3.967070);
  LatLng sourceLocation = const LatLng(5.3502292, -3.9881887);
// void _addMarker(LatLng pos){

//   if(controller.origin == null || (controller.origin !=null && controller.destination  != null)){
//     Obx(() => controller.origin=Marker(
//       markerId: const InfoWindow(title: "origin"),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//       position: pos
//     ))
//   }
// }
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
  ];

  // void getPolyPoints() async {
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     apikey,
  //     PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
  //     PointLatLng(destinationLocaton.latitude, destinationLocaton.longitude),
  //     travelMode: TravelMode.driving,
  //   );
  //   // wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]);
  //   // print("result de  ${result.points}");
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //       // print("polinecoordonnées $polylineCoordinates");
  //
  //     });
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Future<void> getLocation() async {
  //   bool serviceEnabled;

  //   LocationPermission permission;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     await Geolocator.openLocationSettings();
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   streamSubscription =
  //       Geolocator.getPositionStream().listen((Position position) {
  //     originLatitude = double.parse("${position.latitude}");
  //     originLongitude = double.parse("${position.longitude}");
  //     // getAddressFromLatLang(position);
  //     print(originLatitude);
  //     print(originLongitude);
  //   });
  // }
}
