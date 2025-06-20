import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/app colors/app_colors.dart';
import '../../utils/constants/typography/typography.dart';
import '../../views/services/controllers/services_controller.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final GlobalKey<FormState> formKey;
  const LoginButton(
      {super.key,
      required this.title,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController);
    return TextButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          Get.find<ServicesController>().login();
        } else {
          Get.snackbar(
            "Echec",
            "Veuillez remplir correctement les champs",
            snackPosition: SnackPosition.TOP,
            icon: const Icon(
              Icons.warning_amber_outlined,
              color: Colors.red,
            ),
          );
        }
      },
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
            AppTypography.medium16(text: title, color: AppColor.white)
          ],
        ),
      ),
    );
  }
}
