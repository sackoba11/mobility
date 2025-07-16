import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/app colors/app_colors.dart';
import '../../../utils/constants/app string/app_string.dart';
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
              hint: AppString.email,
              controller: controller.emailLogin,
              keyboardType: TextInputType.emailAddress,
              validator: Validator.validateEmail,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomInput(
              hint: AppString.password,
              controller: controller.passwordLogin,
              keyboardType: TextInputType.visiblePassword,
              validator: Validator.validatePassword,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButtonWithoutIcon(
              title: AppString.connect,
              loading: loading,
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await Get.find<ServicesController>()
                      .loginWithEmail(loading: loading);
                  controller.emailLogin.text = '';
                  controller.passwordLogin.text = '';
                } else {
                  HelpFunctions.customSnackbar(
                      title: AppString.echec,
                      message: AppString.completeAllFields,
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
