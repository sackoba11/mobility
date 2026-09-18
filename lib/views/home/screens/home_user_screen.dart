import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/common/assets/assets.gen.dart';
import 'package:mobility/data/repositories/authRepositiry/auth_repository_impl.dart';

import '../../../common/help_functions/help_functions.dart';
import '../../../common/widgets/user_avatar.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_user_controller.dart';

/// Accueil passager (Phase 4) : choix du mode de transport.
class HomeUserScreen extends GetView<HomeUserController> {
  const HomeUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<HomeUserController>()) {
      Get.put(HomeUserController());
    }
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final firstName =
        controller.currentUser?.displayName?.trim().split(' ').firstOrNull ??
            controller.currentUser?.email?.split('@').firstOrNull ??
            '';
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) =>
          HelpFunctions.onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: UserAvatar(user: controller.currentUser, radius: 20),
          ),
          actions: [
            IconButton(
              tooltip: "Se déconnecter",
              onPressed: () async {
                await AuthRepositoryImpl().signOutFromGoogle().whenComplete(
                  () => Get.offAllNamed(Paths.services),
                );
              },
              icon: const Icon(Icons.logout_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firstName.isEmpty ? "Bonjour 👋" : "Bonjour $firstName 👋",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Où allez-vous aujourd'hui ? Choisissez votre transport.",
                style: theme.textTheme.bodyLarge?.copyWith(
                    color: scheme.onSurfaceVariant),
              ),
              const SizedBox(height: 24),
              _TransportCard(
                icon: Assets.bus.svg(width: 48, height: 48),
                title: "Bus",
                subtitle: "Sotra — lignes et horaires en direct",
                badge: "Direct",
                onTap: () => Get.toNamed(Paths.homeBus),
              ),
              const SizedBox(height: 12),
              _TransportCard(
                icon: Assets.bus.svg(width: 48, height: 48),
                title: "Gbaka • Taxi",
                subtitle: "Gares les plus proches de vous",
                badge: "Proximité",
                onTap: () => Get.toNamed(Paths.homeOtherCar),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TransportCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final String badge;
  final VoidCallback onTap;

  const _TransportCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.badge,
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
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: scheme.primary,
                  borderRadius: BorderRadius.circular(18),
                ),
                alignment: Alignment.center,
                child: icon,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: scheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(badge,
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: scheme.onSecondaryContainer)),
                    ),
                    const SizedBox(height: 6),
                    Text(title,
                        style: theme.textTheme.titleLarge),
                    const SizedBox(height: 2),
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
