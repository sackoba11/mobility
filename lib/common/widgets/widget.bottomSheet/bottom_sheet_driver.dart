import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/app colors/app_colors.dart';
import '../../../utils/validators/validator.dart';
import '../../../views/services/controllers/services_controller.dart';
import '../../help_functions/help_functions.dart';
import '../custom_input.dart';
import '../custom_button_without_icon.dart';

class BottomSheetDriver extends StatelessWidget {
  const BottomSheetDriver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> loading = ValueNotifier(false);
    final formKey = GlobalKey<FormState>();
    var controller = Get.find<ServicesController>();

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomInput(
              hint: "Email",
              controller: controller.emailLogin,
              keyboardType: TextInputType.emailAddress,
              validator: Validator.validateEmail,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomInput(
              hint: "Mot de passe",
              controller: controller.passwordLogin,
              keyboardType: TextInputType.visiblePassword,
              validator: Validator.validatePassword,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButtonWithoutIcon(
              title: "Se connecter",
              loading: loading,
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await Get.find<ServicesController>()
                      .loginWithEmail(loading: loading);
                } else {
                  HelpFunctions.customSnackbar(
                      title: "Echec",
                      message: 'Veuillez remplir tous les champs',
                      colorText: AppColor.error.withOpacity(0.5),
                      icon: Icons.warning_amber_outlined);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
