import 'dart:developer' as developer;
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Helpers {
  static List<ConnectivityResult> _connectionStatus = <ConnectivityResult>[];
  static final Connectivity _connectivity = Connectivity();
  List<ConnectivityResult> get connectionStatus => _connectionStatus;

  static Future<void> checkConnectivity() async {
    try {
      _connectionStatus = await (_connectivity.checkConnectivity());
      developer
          .log('Connection status available : ${_connectionStatus.first.name}');
      if (_connectionStatus.contains(ConnectivityResult.none)) {
        // No available network types
        Get.snackbar(
            'Aucun accès à internet', 'Veuillez vous connecter à internet');
      }
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    return;
  }

  static int exitApp() {
    return exit(0);
  }

  static Future<void> onWillPop(context) async {
    await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text(
              "Fermeture",
              textAlign: TextAlign.center,
            ),
            content: const Text(
              "Voulez-vous quitter l'application ?",
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: (() {
                    exitApp();
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
  }
}
