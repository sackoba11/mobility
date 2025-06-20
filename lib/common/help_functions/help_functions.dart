import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../utils/constants/app colors/app_colors.dart';
import '../../utils/constants/app string/app_string.dart';
import '../../utils/helpers/helpers.dart';
import '../widgets/dodge_keyboard.dart';

class HelpFunctions {
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
                    Helpers.exitApp();
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
