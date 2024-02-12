import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app colors/app_colors.dart';
import '../../constants/typography/typography.dart';
import '../services/controllers/services_controller.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final bool login;
  const LoginButton({super.key, required this.title, required this.login});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController);
    return TextButton(
      onPressed: () {
        login
            ? Get.find<ServicesController>().login()
            : Get.find<ServicesController>().driverRegister();
      },
      child: Container(
        width: 372,
        height: 60,
        decoration: ShapeDecoration(
          color: AppColor.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTypography().medium16(text: title, color: AppColor.white)
          ],
        ),
      ),
    );
  }
}
