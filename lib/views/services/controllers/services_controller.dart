import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/help_functions/help_functions.dart';
import '../../../data/repositories/authRepositiry/auth_repository_impl.dart';
import '../../../data/repositories/authRepositiry/i_auth_repository.dart';
import '../../../utils/constants/app colors/app_colors.dart';
import '../../home/screens/home_driver_screen.dart';
import '../../home/screens/home_user_screen.dart';

class ServicesController extends GetxController {
  late IAuthRepository iAuthRepository = AuthRepositoryImpl();

  //Login Screen
  final emailLogin = TextEditingController();
  final passwordLogin = TextEditingController();
  late final RxBool isConnect = false.obs;

  @override
  void onInit() async {
    super.onInit();
    isConnect.value = await HelpFunctions.checkConnectivity();
    // OtherCarRepositoryImpl().addAllGares();
  }

  Future<void> loginWithEmail({required ValueNotifier<bool> loading}) async {
    try {
      isConnect.value = await HelpFunctions.checkConnectivity();
      if (isConnect.value == true) {
        loading.value = true;
        final response = (await iAuthRepository.loginWithEmailAndPassword(
                email: emailLogin.text, password: passwordLogin.text))
            .fold((l) => null, (r) => r);
        if (response != null) {
          loading.value = false;
          Get.off(const HomeDriverScreen());
        } else {
          loading.value = false;
          Get.snackbar(
            "Erreur",
            "Veuillez vérifier l'email ou le mot de passe",
          );
        }
      } else {
        HelpFunctions.customSnackbar(
            title: 'Aucun accès à internet',
            message: 'Veuillez vous connecter à internet',
            colorText: AppColor.error,
            icon: Icons.wifi_tethering_error);
      }
    } catch (e) {
      Get.snackbar("Erreur :", e.toString());
    }
  }

  Future<void> loginWithGoogle({required ValueNotifier<bool> loading}) async {
    try {
      isConnect.value = await HelpFunctions.checkConnectivity();
      if (isConnect.value == true) {
        loading.value = true;
        final response = (await iAuthRepository.signInWithGoogle())
            .fold((l) => null, (r) => r);

        if (response != null) {
          loading.value = false;
          Get.offAll(const HomeUserScreen());
        } else {
          loading.value = false;
          Get.back();
        }
      } else {
        HelpFunctions.customSnackbar(
            title: 'Aucun accès à internet',
            message: 'Veuillez vous connecter à internet',
            colorText: AppColor.error,
            icon: Icons.wifi_tethering_error);
      }
    } catch (e) {
      Get.snackbar("Erreur :", e.toString());
    }
  }
}
