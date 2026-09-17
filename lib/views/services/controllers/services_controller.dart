import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/help_functions/help_functions.dart';
import '../../../data/repositories/authRepositiry/auth_repository_impl.dart';
import '../../../data/repositories/authRepositiry/i_auth_repository.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constants/app colors/app_colors.dart';

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
        final credential = (await iAuthRepository.loginWithEmailAndPassword(
                email: emailLogin.text.trim(), password: passwordLogin.text))
            .fold((l) => null, (r) => r);
        if (credential?.user == null) {
          loading.value = false;
          Get.snackbar(
            "Erreur",
            "Veuillez vérifier l'email ou le mot de passe",
          );
          return;
        }
        // Rôle depuis Firestore, jamais supposé : un passager qui se login
        // en email va sur homeUser, un chauffeur sur homeDriver.
        final user = (await iAuthRepository.getUser(credential!.user!.uid))
            .fold((l) => null, (r) => r);
        loading.value = false;
        if (user != null && user.isDriver) {
          Get.offAllNamed(Paths.homeDriver);
        } else {
          Get.offAllNamed(Paths.homeUser);
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
          Get.offAllNamed(Paths.homeUser);
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
