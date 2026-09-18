import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/app colors/app_colors.dart';
import '../../../utils/validators/validator.dart';
import '../../../views/services/controllers/services_controller.dart';
import '../../help_functions/help_functions.dart';
import '../app_button.dart';
import '../custom_input.dart';

/// Connexion chauffeur par email (Phase 4).
class BottomSheetDriver extends StatelessWidget {
  const BottomSheetDriver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loading = ValueNotifier(false);
    final formKey = GlobalKey<FormState>();
    final controller = Get.find<ServicesController>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Espace chauffeur",
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(
              "Connectez-vous avec votre compte chauffeur.",
              style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomInput(
              hint: "Email",
              controller: controller.emailLogin,
              keyboardType: TextInputType.emailAddress,
              validator: Validator.validateEmail,
            ),
            const SizedBox(height: 12),
            CustomInput(
              hint: "Mot de passe",
              controller: controller.passwordLogin,
              keyboardType: TextInputType.visiblePassword,
              validator: (v) => Validator.validateRequired(
                  v, "Le mot de passe est requis."),
            ),
            const SizedBox(height: 20),
            AppButton(
              title: "Se connecter",
              loading: loading,
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await Get.find<ServicesController>()
                      .loginWithEmail(loading: loading);
                } else {
                  HelpFunctions.customSnackbar(
                      title: "Échec",
                      message: 'Veuillez remplir correctement tous les champs',
                      colorText: AppColor.error,
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
