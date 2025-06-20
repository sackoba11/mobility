import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/repositories/authRepositiry/auth_repository_impl.dart';
import '../../../data/repositories/authRepositiry/i_auth_repository.dart';
import '../../../models/user/my_user.dart';
import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  IAuthRepository iAuthRepository = AuthRepositoryImpl();
  User? currentUser;

  @override
  void onInit() async {
    super.onInit();
    currentUser = FirebaseAuth.instance.currentUser;
    await animationInitilization();
    redirection();
  }

  redirection() async {
    // Check if the user is logged in
    if (currentUser != null) {
      String uid = currentUser!.uid;
      MyUser user =
          (await iAuthRepository.getUser(uid)).fold((l) => null, (r) => r)!;
      if (user.isDriver) {
        Get.offAllNamed(Paths.homeDriver);
      } else {
        Get.offAllNamed(Paths.homeUser);
      }
    } else {
      Get.offAllNamed(Paths.services);
    }
  }

  animationInitilization() async {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
    animation.addListener(() => update());
    await animationController.forward();
  }
}
