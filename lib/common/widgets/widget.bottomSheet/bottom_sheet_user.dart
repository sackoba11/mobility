import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../views/services/controllers/services_controller.dart';
import '../../assets/assets.gen.dart';
import '../app_button.dart';

/// Connexion passager via Google (Phase 4).
class BottomSheetUser extends StatelessWidget {
  const BottomSheetUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loading = ValueNotifier(false);
    if (!Get.isRegistered<ServicesController>()) {
      Get.put(ServicesController());
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("Bienvenue 👋",
              style: theme.textTheme.titleLarge,
              textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text(
            "Connectez-vous avec votre compte Google pour continuer.",
            style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          AppButton(
            title: "Se connecter avec Google",
            icon: Assets.googoleIcon.svg(width: 24, height: 24),
            loading: loading,
            onPressed: () async {
              await Get.find<ServicesController>()
                  .loginWithGoogle(loading: loading);
            },
          ),
        ],
      ),
    );
  }
}
