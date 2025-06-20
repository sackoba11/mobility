import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/validators/validator.dart';
import '../../../views/services/controllers/services_controller.dart';
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
            ),
          ],
        ),
      ),
    );
  }
}
