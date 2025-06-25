import 'dart:developer' as developer;
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../utils/constants/app colors/app_colors.dart';
import '../../utils/constants/app string/app_string.dart';
import '../widgets/dodge_keyboard.dart';

class HelpFunctions {
  static List<ConnectivityResult> _connectionStatus = <ConnectivityResult>[];
  static final Connectivity _connectivity = Connectivity();
  List<ConnectivityResult> get connectionStatus => _connectionStatus;

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
  
  static Future<bool> checkConnectivity() async {
    try {
      _connectionStatus = await (_connectivity.checkConnectivity());
      if (_connectionStatus.contains(ConnectivityResult.none)) {
        // No available network types
        HelpFunctions.customSnackbar(
            title: 'Aucun accès à internet',
            message: 'Veuillez vous connecter à internet',
            colorText: AppColor.error,
            icon: Icons.wifi_tethering_error);
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return false;
    }
  }

  static Future customModalSheet(
      {required BuildContext context, required Widget child}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constaints) {
          return DodgeKeyboard(
            child: child,
          );
        });
      },
    );
  }

  static SnackbarController customSnackbar(
      {required String title,
      required String message,
      required Color colorText,
      required IconData icon}) {
    return Get.snackbar(title, '',
        backgroundColor: AppColor.white,
        colorText: colorText,
        messageText: Text(
          message,
        ),
        icon: Icon(
          icon,
          color: colorText,
        ),
        duration: Duration(seconds: 1),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20));
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
                    exit(0);
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

  static Future<dynamic> popupLogout() {
    return Get.defaultDialog(
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.black,
        backgroundColor: AppColor.background,
        buttonColor: AppColor.error,
        title: AppString.areyousure,
        textConfirm: AppString.yes,
        content: Text(AppString.doyouwanttodisconnect),
        onConfirm: () {
          Get.offAllNamed(Paths.services);
        },
        onCancel: () {});
  }
}
