import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/app colors/app_colors.dart';
import '../../utils/constants/typography/typography.dart';

class RegisterBtn extends StatelessWidget {
  const RegisterBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Get.toNamed("/driverPage"),
      child: Container(
        width: 372,
        height: 60,
        decoration: ShapeDecoration(
          color: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTypography.medium16(text: "S’inscrire", color: AppColor.white)
          ],
        ),
      ),
    );
  }
}
