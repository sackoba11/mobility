import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/assets/assets.gen.dart';
import '../controllers/splash_screen_controller.dart';

/// Écran de démarrage (Phase 4) : identité produit + chargement.
class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Scaffold(
      backgroundColor: scheme.primary,
      body: SafeArea(
        child: Center(
          child: GetBuilder<SplashScreenController>(
            builder: (controller) {
              final scale = controller.animation.value.clamp(0.0, 1.0);
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: 0.6 + 0.4 * scale,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: scheme.onPrimary,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      alignment: Alignment.center,
                      child: Assets.road.svg(width: 72, height: 72),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Opacity(
                    opacity: scale,
                    child: Text(
                      "Mobility",
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: scheme.onPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Opacity(
                    opacity: scale,
                    child: Text(
                      "Bougez malin à Abidjan",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: scheme.onPrimary
                            .withValues(alpha: 0.8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: scheme.onPrimary,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
