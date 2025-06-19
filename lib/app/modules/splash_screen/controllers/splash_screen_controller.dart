import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:mobility/app/models/user/my_user.dart';
import 'package:mobility/app/repositories/authRepositiry/i_auth_repository.dart';
import 'package:mobility/app/repositories/authRepositiry/auth_repository_impl.dart';
import 'package:mobility/app/routes/app_pages.dart';

import '../../../repositories/OtherCarRepository/i_other_car_repository.dart';
import '../../../repositories/OtherCarRepository/other_car_repository_impl.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  IOtherCarRepository iOtherCarRepository = OtherCarRepositoryImpl();
  IAuthRepository iAuthRepository = AuthRepositoryImpl();
  User? currentUser;

  late List<ConnectivityResult> _connectionStatus = <ConnectivityResult>[];
  final Connectivity _connectivity = Connectivity();
  List<ConnectivityResult> get connectionStatus => _connectionStatus;

  @override
  void onInit() async {
    super.onInit();
    currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {}
    splashDuration();
    animationInitilization();
    checkConnectivity();
    // (await iOtherCarRepository.addAllGares()).isRight()
    //     ? print(true)
    //     : print(false);
  }

  splashDuration() async {
    return Future.delayed(
      const Duration(seconds: 3),
      () async {
        // Check if the user is logged in
        if (currentUser != null) {
          String uid = currentUser!.uid;
          MyUser user =
              (await iAuthRepository.getUser(uid)).fold((l) => null, (r) => r)!;
          if (user.isDriver) {
            Get.offAllNamed(Routes.homeDriver);
          } else {
            Get.offAllNamed(Routes.homeUser);
          }
        } else {
          Get.offAllNamed(Routes.services);
        }
      },
    );
  }

  animationInitilization() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
    animation.addListener(() => update());
    animationController.forward();
  }

  Future<void> checkConnectivity() async {
    try {
      _connectionStatus = await (_connectivity.checkConnectivity());
      developer
          .log('Connection status available : ${_connectionStatus.first.name}');
      if (connectionStatus.contains(ConnectivityResult.none)) {
        // No available network types
        Get.snackbar('Pas accès a internet', 'Veuillez vous connecter');
      }
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    return;
  }
}
