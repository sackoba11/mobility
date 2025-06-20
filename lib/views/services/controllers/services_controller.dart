import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/data/repositories/authRepositiry/auth_repository_impl.dart';

import '../../../data/repositories/authRepositiry/i_auth_repository.dart';
import '../../home/screens/home_driver_screen.dart';

class ServicesController extends GetxController {
  late IAuthRepository iAuthRepository = AuthRepositoryImpl();

  //Login Screen
  final emailLogin = TextEditingController();
  final passwordLogin = TextEditingController();

  // @override
  // void onInit() {
  //   super.onInit();
  //   // OtherCarRepositoryImpl().addAllGares();
  // }

  Future<void> login() async {
    var response = await iAuthRepository.loginWithEmailAndPassword(
        email: emailLogin.text, password: passwordLogin.text);
    if (response.isRight()) {
      Get.off(const HomeDriverScreen());
    } else {
      Get.snackbar("Erreur", "Veuillez vérifier l'email ou le mot de passe");
    }
  }
}
