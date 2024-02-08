import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobility/app/routes/app_pages.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void onInit() {
    super.onInit();
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

  static splashDuration() async {
    return Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAllNamed(Routes.services);
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
