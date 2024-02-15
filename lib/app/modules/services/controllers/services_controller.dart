import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/app/repositories/authRepositiry/auth_repository_impl.dart';

import '../../home/views/home_driver_view.dart';

class ServicesController extends GetxController {
  final name = TextEditingController();
  String? nameTextError;
  final number = TextEditingController();
  String? numberTextError;
  final email = TextEditingController();
  String? emailTextError;
  final password = TextEditingController();
  String? passwordTextError;
  final typeOfCar = TextEditingController();
  String? typeCarTextError;
  final brand = TextEditingController();
  String? brandTextError;
  final color = TextEditingController();
  String? colorTextError;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  static int exitApp() {
    return exit(0);
  }

// String? validateEmail(String? value) {
//     if (value!.isEmpty) {
//       setState(() {
//         controller.emailTextError = 'Saisissez votre email';
//       });
//       return controller.emailTextError!;
//     } else if (!isEmailValid(value)) {
//       setState(() {
//         controller.emailTextError = 'Entrez un email valide';
//       });
//       return controller.emailTextError!;
//     } else {
//       setState(() {
//         controller.emailTextError = null;
//       });
//       return null;
//     }
//   }

//   bool isEmailValid(String email) {
//     return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
//   }

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

  Future<void> login() async {
    if (email.text.isNotEmpty) {
      if (password.text.isNotEmpty) {
        var response = await AuthRepositoryImpl().loginWithEmailAndPassword(
            email: email.text, password: password.text);
        if (response.isRight()) {
          Get.off(const HomeDriverView());
        } else {
          Get.snackbar(
              "Erreur", "Veuillez vérifier l'email ou le mot de passe");
        }
      }
    }
  }

  Future<void> driverRegister() async {
    if (name.text.isNotEmpty) {
      if (number.text.isNotEmpty) {
        if (email.text.isNotEmpty) {
          if (password.text.isNotEmpty) {
            if (typeOfCar.text.isNotEmpty) {
              if (brand.text.isNotEmpty) {
                if (color.text.isNotEmpty) {
                  var response = await AuthRepositoryImpl()
                      .signInWithEmailAndPassword(
                          userName: name.text,
                          userNumber: number.text,
                          typeOfCar: typeOfCar.text,
                          brand: brand.text,
                          color: color.text,
                          userEmail: email.text,
                          userPassword: password.text);
                  // .whenComplete(() => Get.off(const HomeDriverView()));

                  if (response.isRight()) {
                    Get.off(const HomeDriverView());
                  } else {
                    Get.snackbar("Erreur",
                        "Veuillez vérifier l'email ou le mot de passe");
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
