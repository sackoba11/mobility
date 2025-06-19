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
  List<Bus> busList = <Bus>[].obs;
  List<Bus> availableBusList = <Bus>[].obs;
  List<Bus> searchBus = <Bus>[].obs;
  RxInt? number = 0.obs;

  User? currentUser;
  TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    currentUser = FirebaseAuth.instance.currentUser;
    await getBus();
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

  Future<void> getBus() async {
    isLoading(true);
    busList = (await busRepository.getAllBus()).fold((l) => [], (r) => r);
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
}
