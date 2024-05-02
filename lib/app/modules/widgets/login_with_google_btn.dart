import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/app/assets/assets.gen.dart';
import 'package:mobility/app/repositories/authRepositiry/auth_repository_impl.dart';

import '../../constants/app colors/app_colors.dart';
import '../../constants/typography/typography.dart';
import '../home/views/home_user_view.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        try {
          final response = (await AuthRepositoryImpl().signInWithGoogle())
              .fold((l) => null, (r) => r);
          if (response != null) {
            Get.offAll(const HomeUserView());
          } else {
            Get.back();
          }
        } catch (e) {
          Get.snackbar("Erreur :", e.toString());
        }
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
            Assets.googoleIcon.svg(),
            // SvgPicture.asset(AppString.googleSvg),
            const SizedBox(
              width: 20,
            ),
            AppTypography().medium16(
                text: "Se Connecter avec google", color: AppColor.white)
          ],
        ),
      ),
    );
  }
}
