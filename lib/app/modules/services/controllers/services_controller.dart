import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/app/repositories/authRepositiry/auth_repository_impl.dart';

import '../../../repositories/OtherCarRepository/other_car_repository_impl.dart';
import '../../../repositories/authRepositiry/i_auth_repository.dart';
import '../../home/views/home_driver_view.dart';

class ServicesController extends GetxController {
  late IAuthRepository iAuthRepository = AuthRepositoryImpl();
  //Register sceen
  final name = TextEditingController();
  String? nameTextError;
  final number = TextEditingController();
  String? numberTextError;
  final email = TextEditingController();
  String? emailTextError;
  final password = TextEditingController();
  String? passwordTextError;
  String? typeOfCar;
  String? typeCarTextError;
  final brand = TextEditingController();
  String? brandTextError;
  final color = TextEditingController();
  String? colorTextError;

  //Login Screen
  final emailLogin = TextEditingController();
  String? emailLoginTextError;
  final passwordLogin = TextEditingController();
  String? passwordLoginTextError;

  final List<String> items = ['Gbaka', ' Taxi Collectif', 'Autres'];

  @override
  void onInit() {
    super.onInit();
    OtherCarRepositoryImpl().addAllGares();
  }

  

  static int exitApp() {
    return exit(0);
  }

  static Future<bool> onWillPop(context) async {
    bool value = false;
    await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text(
              "Fermeture",
              textAlign: TextAlign.center,
            ),
            content: const Text(
              " Êtes vous sûr de vouloir quitter l'application ?",
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: (() {
                    ServicesController.exitApp();
                  }),
                  child: const Text(
                    "Oui",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  )),
              TextButton(
                  onPressed: (() {
                    Navigator.of(context).pop();
                  }),
                  child: const Text(
                    "Non",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          );
        });
    return value;
  }

  bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  Future<void> login() async {
    var response = await iAuthRepository.loginWithEmailAndPassword(
        email: emailLogin.text, password: passwordLogin.text);
    if (response.isRight()) {
      Get.off(const HomeDriverView());
    } else {
      Get.snackbar("Erreur", "Veuillez vérifier l'email ou le mot de passe");
    }
  }

  // Future<void> driverRegister() async {
  //   if (name.text.isNotEmpty) {
  //     if (number.text.isNotEmpty) {
  //       if (email.text.isNotEmpty) {
  //         if (password.text.isNotEmpty) {
  //           if (typeOfCar!.isNotEmpty) {
  //             if (brand.text.isNotEmpty) {
  //               if (color.text.isNotEmpty) {
  //                 var response = await AuthRepositoryImpl()
  //                     .signInWithEmailAndPassword(
  //                         userName: name.text,
  //                         userNumber: number.text,
  //                         typeOfCar: typeOfCar,
  //                         brand: brand.text,
  //                         color: color.text,
  //                         userEmail: email.text,
  //                         userPassword: password.text);

  //                 if (response.isRight()) {
  //                   Get.off(const HomeDriverView());
  //                 } else {
  //                   Get.snackbar("Erreur",
  //                       "Veuillez vérifier l'email ou le mot de passe");
  //                 }
  //               }
  //             }
  //           }
  //         }
  //       }
  //     }
  //   }
  // }
}
