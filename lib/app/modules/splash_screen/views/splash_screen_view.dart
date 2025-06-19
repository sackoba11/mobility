import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../assets/assets.gen.dart';
import '../../../constants/app colors/app_colors.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        body: GetBuilder<SplashScreenController>(
          init: SplashScreenController(),
          builder: (controller) {
            return Center(
              child: Assets.road.svg(
                width: controller.animation.value * 200,
                height: controller.animation.value * 200,
              ),
            );
          },
        ));
  }
}
