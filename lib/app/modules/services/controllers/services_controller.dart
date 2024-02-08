import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesController extends GetxController {
  //TODO: Implement ServicesController

  final count = 0.obs;
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
}
