import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobility/common/assets/assets.gen.dart';

import '../../../common/help_functions/help_functions.dart';
import '../../../common/widgets/widget.bottomSheet/bottom_sheet_driver.dart';
import '../../../common/widgets/widget.bottomSheet/bottom_sheet_user.dart';
import '../../../utils/constants/app string/app_string.dart';
import '../controllers/services_controller.dart';

/// Écran d'accueil non connecté (Phase 4) : choix du rôle Passager / Chauffeur.
class ServiceScreen extends GetView<ServicesController> {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [scheme.primary, scheme.inversePrimary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Assets.road.svg(width: 72, height: 72),
                    const SizedBox(height: 16),
                    Text(
                      "Mobility",
                      style: theme.textTheme.headlineLarge?.copyWith(
                        color: scheme.onPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppString.descriptionService,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: scheme.onPrimary.withValues(alpha: 0.85),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Text("Qui êtes-vous ?",
                  style: theme.textTheme.titleLarge),
              const SizedBox(height: 4),
              Text(
                "Choisissez votre profil pour continuer.",
                style: theme.textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurfaceVariant),
              ),
              const SizedBox(height: 16),
              _RoleCard(
                icon: Assets.passenger.svg(width: 44, height: 44),
                title: AppString.passenger,
                subtitle: AppString.searchService,
                onTap: () => HelpFunctions.customModalSheet(
                    context: context, child: const BottomSheetUser()),
              ),
              const SizedBox(height: 12),
              _RoleCard(
                icon: Assets.driver.svg(width: 44, height: 44),
                title: AppString.driverBus,
                subtitle: AppString.activateService,
                onTap: () => HelpFunctions.customModalSheet(
                    context: context, child: const BottomSheetDriver()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _RoleCard({
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
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: scheme.primaryContainer,
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
                    Text(title, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(subtitle,
                        style: theme.textTheme.bodyMedium?.copyWith(
                            color: scheme.onSurfaceVariant)),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: scheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}
