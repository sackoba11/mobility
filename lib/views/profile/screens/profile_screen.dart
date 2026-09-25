import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/user_avatar.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

/// Écran Profil (Phase shell) : compte, préférences, déconnexion.
class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const AppLoadingView(message: 'Chargement du profil...');
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  UserAvatar(
                      user: controller.firebaseUser.value, radius: 32),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.displayName,
                            style: theme.textTheme.titleLarge),
                        const SizedBox(height: 2),
                        Text(controller.email,
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(
                                    color: scheme.onSurfaceVariant)),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: scheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            controller.isDriverAccount.value
                                ? 'Chauffeur'
                                : 'Passager',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: scheme.onSecondaryContainer),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text('Préférences',
                  style: theme.textTheme.titleMedium),
              const SizedBox(height: 8),
              Card(
                child: SwitchListTile(
                  title: const Text('Mode sombre'),
                  subtitle:
                      const Text('Désactivé = suit le système'),
                  secondary: Icon(
                      controller.isDark.value
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      color: scheme.primary),
                  value: controller.isDark.value,
                  onChanged: controller.toggleTheme,
                ),
              ),
              const SizedBox(height: 16),
              Text('Compte', style: theme.textTheme.titleMedium),
              const SizedBox(height: 8),
              Card(
                child: ListTile(
                  leading:
                      Icon(Icons.logout, color: scheme.error),
                  title: const Text('Se déconnecter'),
                  onTap: () => _confirmLogout(context),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Text('Mobility v1.0.0',
                    style: theme.textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant)),
              ),
            ],
          ),
        );
      }),
    );
  }

  Future<void> _confirmLogout(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Get.defaultDialog(
      title: 'Déconnexion',
      middleText: 'Voulez-vous vraiment vous déconnecter ?',
      textCancel: 'Annuler',
      textConfirm: 'Se déconnecter',
      confirmTextColor: Colors.white,
      buttonColor: scheme.error,
      onConfirm: () {
        Get.back();
        controller.logout(Paths.services);
      },
    );
  }
}
