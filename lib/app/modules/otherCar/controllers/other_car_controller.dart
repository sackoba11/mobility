import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/app/error/app_error.dart';
import 'package:mobility/app/models/gare/gare.dart';
import '../../../constants/app colors/app_colors.dart';
import '../../../repositories/OtherCarRepository/i_other_car_repository.dart';
import '../../../repositories/OtherCarRepository/other_car_repository_impl.dart';

class OtherCarController extends GetxController {
  IOtherCarRepository otherCarRepositoryImpl = OtherCarRepositoryImpl();
  RxBool filterGbaka = false.obs;
  RxBool filterTaxi = false.obs;
  RxList<Gare> gares = <Gare>[].obs;
  RxList<Gare> availableGare = <Gare>[].obs;
  RxBool isLoading = true.obs;
  Rx<Gare> gare = Gare(
      name: "fe",
      commune: "sce",
      type: "Taxi",
      location: {"lat": 5.3502292, "long": -3.9881887}).obs;
  TextEditingController textEdittingSearch = TextEditingController();

  var originLatitude = "5.3502292".obs, originLongitude = "-3.9881887".obs;
  var destLatitude = "5.3589712".obs, destLongitude = "-4.0272913".obs;
  LatLng second = const LatLng(5.354784, -3.974198);
  LatLng first = const LatLng(5.358065, -3.964597);
  LatLng destinationLocaton = const LatLng(5.351888, -3.983774);
  LatLng sourceLocation = const LatLng(5.3502292, -3.9881887);

  @override
  void onInit() async {
    super.onInit();
    availableGare.value = (await getGares()).fold((l) => [], (r) => r);
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

  Future<List<Gare>> getsearchGare(String search) async {
    var searchGare = gares
        .where((bus) => bus.name
            .toLowerCase()
            .toString()
            .contains(search.toLowerCase().toString()))
        .toList();
    return searchGare;
  }

  Future<void> filter() async {
    await Get.defaultDialog(
        title: "",
        backgroundColor: AppColor.background,
        radius: 10,
        // onWillPop: () async {
        //   print('object');
        //   return true;
        // },
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        content: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Gbaka",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Obx(() => Checkbox(
                    value: filterGbaka.value,
                    activeColor: AppColor.primary,
                    onChanged: (value) {
                      filterGbaka.value = !filterGbaka.value;
                    })),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Taxi",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Obx(() => Checkbox(
                    value: filterTaxi.value,
                    activeColor: AppColor.primary,
                    onChanged: (value) {
                      filterTaxi.value = !filterTaxi.value;
                    })),
              ],
            )
          ],
        ));
  }
//   String apikey = "AIzaSyDSBWmU7p_y7wPfvZI98S6hypnDXT5aF34";

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
}
