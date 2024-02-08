import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/app/assets/assets.gen.dart';

import '../../constants/app colors/app_colors.dart';
import '../../constants/typography/typography.dart';
import '../home/views/home_user_view.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        Get.to(const HomeUserView());
        // try {
        //   ErrorCatcher.extractData(await locator.get<IAuthService>().login());
        //   // ignore: use_build_context_synchronously
        //   context.push(AppRoutes.typeOfCar);
        // } catch (e) {
        //   // ignore: use_build_context_synchronously
        //   context.showErrorSnackBar(e.toString());
        // }
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
