import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/app colors/app_colors.dart';
import '../../../utils/constants/typography/typography.dart';
import '../../../views/services/controllers/services_controller.dart';
import '../../assets/assets.gen.dart';
import '../custom_button_without_icon.dart';

class BottomSheetUser extends StatelessWidget {
  const BottomSheetUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> loading = ValueNotifier(false);
    return SizedBox(
        height: 140,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AppTypography.regularSmall(
                  text: "Connectez-vous avec votre compte Google",
                  color: AppColor.primary),
              const SizedBox(
                height: 20,
              ),
              CustomButtonWithoutIcon(
                title: "Se Connecter avec google",
                icon: Assets.googoleIcon.svg(),
                loading: loading,
                onPressed: () async {
                  await Get.find<ServicesController>()
                      .loginWithGoogle(loading: loading);
                },
              )
            ],
          ),
        ));
  }
}
