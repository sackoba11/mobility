import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/common/assets/assets.gen.dart';

import '../../controllers/shell_controller.dart';
import '../../../home/controllers/home_user_controller.dart';

/// Accueil passager (Phase shell) : salut + accès directs aux transports.
/// Remplace l'ancienne page plate à 2 gros boutons.
class PassengerDashboardScreen extends GetView<HomeUserController> {
  const PassengerDashboardScreen({super.key});

  String _firstName(User? user) {
    final name = user?.displayName?.trim().split(' ').firstOrNull;
    if (name != null && name.isNotEmpty) return name;
    return user?.email?.split('@').firstOrNull ?? '';
  }

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<HomeUserController>()) {
      Get.put(HomeUserController());
    }
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final name = _firstName(controller.currentUser);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name.isEmpty ? 'Bonjour 👋' : 'Bonjour $name 👋',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Où allez-vous aujourd\'hui ?',
                style: theme.textTheme.bodyLarge?.copyWith(
                    color: scheme.onSurfaceVariant),
              ),
              const SizedBox(height: 20),
              _ShortcutCard(
                icon: Assets.bus.svg(width: 44, height: 44),
                title: 'Bus Sotra',
                subtitle: 'Lignes et bus en direct',
                onTap: () =>
                    Get.find<ShellController>().setTab(1),
              ),
              const SizedBox(height: 12),
              _ShortcutCard(
                icon: Assets.bus.svg(width: 44, height: 44),
                title: 'Gbaka • Taxi',
                subtitle: 'Gares les plus proches',
                onTap: () =>
                    Get.find<ShellController>().setTab(2),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: scheme.primaryContainer.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline,
                        color: scheme.onPrimaryContainer),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Les positions des bus sont partagées en direct par les chauffeurs en service.',
                        style: theme.textTheme.bodySmall?.copyWith(
                            color: scheme.onPrimaryContainer),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShortcutCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ShortcutCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: scheme.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: icon,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: theme.textTheme.titleMedium),
                    const SizedBox(height: 2),
                    Text(subtitle,
                        style: theme.textTheme.bodyMedium?.copyWith(
                            color: scheme.onSurfaceVariant)),
                  ],
                ),
              ),
              Icon(Icons.chevron_right,
                  color: scheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}
