import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobility/app/routes/app_pages.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  User? currentUser;
  @override
  void onInit() {
    super.onInit();
    currentUser = FirebaseAuth.instance.currentUser;
    splashDuration();
    animationInitilization();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  splashDuration() async {
    return Future.delayed(
      const Duration(seconds: 3),
      () {
        print(currentUser);
        Get.offAllNamed(Routes.services);
        // if (currentUser == null) {
        //   Get.offAllNamed(Routes.services);
        // } else {
        //   Get.offAllNamed(Routes.homeUser);
        // }
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
}
