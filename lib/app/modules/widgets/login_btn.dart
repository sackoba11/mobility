import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/app/modules/home/views/home_driver_view.dart';

import '../../constants/app colors/app_colors.dart';
import '../../constants/typography/typography.dart';

class LoginButton extends StatelessWidget {
  final String title;
  const LoginButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(const HomeDriverView());
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
