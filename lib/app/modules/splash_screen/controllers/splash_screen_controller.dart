import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobility/app/models/user/my_user.dart';
import 'package:mobility/app/repositories/authRepositiry/i_auth_repository.dart';
import 'package:mobility/app/repositories/otherCarRepository/i_other_car_repository.dart';
import 'package:mobility/app/repositories/otherCarRepository/other_car_repository_impl.dart';
import 'package:mobility/app/repositories/authRepositiry/auth_repository_impl.dart';
import 'package:mobility/app/routes/app_pages.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  IOtherCarRepository iOtherCarRepository = OtherCarRepositoryImpl();
  IAuthRepository iAuthRepository = AuthRepositoryImpl();
  User? currentUser;
  @override
  void onInit() async {
    super.onInit();
    currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {}
    splashDuration();
    animationInitilization();
    // (await iOtherCarRepository.addAllGares()).isRight()
    //     ? print(true)
    //     : print(false);
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
      () async {
        print("Current User : $currentUser");

        // Get.offAllNamed(Routes.services);

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
}
