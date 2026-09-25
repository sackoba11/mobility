import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/bus/bus_from_firestore/bus.dart';
import '../../../data/repositories/driverRepository/driver_repository_impl.dart';
import '../../../data/repositories/driverRepository/i_driver_repository.dart';

class HomeDriverController extends GetxController {
  IDriverRepository busRepository = DriverRepositoryImpl();
  RxBool isLoading = true.obs;
  RxList<Bus> busList = <Bus>[].obs;
  RxList<Bus> availableBusList = <Bus>[].obs;
  RxList<Bus> searchBus = <Bus>[].obs;
  RxInt? number = 0.obs;

  User? currentUser;
  TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    currentUser = FirebaseAuth.instance.currentUser;
    await getBus();
    isLoading.value = false;
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future<void> getBus() async {
    isLoading(true);
    final result = await busRepository.getAllBus();
    result.fold(
      (l) => busList.clear(),
      (r) => busList.assignAll(r),
    );
    availableBusList.assignAll(busList);

    isLoading(false);
    update();
  }

  Future<void> getBusByNumber(int busNumber) async {
    searchBus.assignAll(busList.where(
        (bus) => bus.number.toString().contains(busNumber.toString())));
    availableBusList.assignAll(searchBus);
    update();
  }
}
