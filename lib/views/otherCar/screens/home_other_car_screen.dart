import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/views/otherCar/controllers/other_car_controller.dart';

import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../models/gare/gare.dart';
import '../../../routes/app_pages.dart';

/// Mini-dashboard Gares Gbaka & Taxi : compteurs + aperçus (5 plus
/// proches) vers les pages dédiées (gares, trajets).
class HomeOtherCarScreen extends GetView<OtherCarController> {
  const HomeOtherCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Gares Gbaka & Taxi')),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.availableGare.value =
              (await controller.getGares()).fold((l) => [], (r) => r);
          controller.availableItinerary.value =
              (await controller.getItinerary())
                  .fold((l) => [], (r) => r);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                child: Text(
                  'Retrouvez la gare la plus proche.',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // --- Compteurs ---
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(() => _DashCard(
                            icon: Icons.location_on_outlined,
                            value: '${controller.garesCount}',
                            label: 'Gares',
                            color: theme.colorScheme.primary,
                            onTap: () =>
                                Get.toNamed(Paths.stations),
                          )),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Obx(() => _DashCard(
                            icon: Icons.route_outlined,
                            value: '${controller.trajetsCount}',
                            label: 'Trajets',
                            color: theme.colorScheme.secondary,
                            onTap: () =>
                                Get.toNamed(Paths.trajets),
                          )),
                    ),
                  ],
                ),
              ),
              // --- Gares proches ---
              _SectionHeader(
                title: 'Gares proches',
                onMore: () => Get.toNamed(Paths.stations),
              ),
              Obx(() {
                if (controller.isLoading.value &&
                    controller.gares.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: AppLoadingView(
                        message: 'Recherche des gares...'),
                  );
                }
                final gares = controller.nearestGares();
                if (gares.isEmpty) {
                  return const _SectionHint(
                      text: 'Aucune gare pour le moment.');
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  itemCount: gares.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final gare = gares[index];
                    return GareCard(
                      gare: gare,
                      onTap: () => _openGare(gare),
                    );
                  },
                );
              }),
              // --- Trajets proches ---
              _SectionHeader(
                title: 'Trajets proches',
                onMore: () => Get.toNamed(Paths.trajets),
              ),
              Obx(() {
                final trajets = controller.nearestTrajets();
                if (trajets.isEmpty) {
                  return const _SectionHint(
                      text: 'Aucun trajet pour le moment.');
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.fromLTRB(20, 0, 20, 24),
                  itemCount: trajets.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final element = trajets[index];
                    return ItineraryCard(
                      itinerary: element,
                      onTap: () {
                        controller.itinerary.value = element;
                        controller.resetFits();
                        Get.toNamed(Paths.secondOtherCar);
                      },
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openGare(Gare gare) async {
    controller.gare.value = gare;
    controller.resetFits();
    Get.toNamed(Paths.detailOtherCar);
    controller.routes.value =
        await controller.getRoutes(gare.location);
    controller.update();
  }
}

/// Carte compteur du dashboard (même gabarit que côté bus).
class _DashCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _DashCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Material(
      color:
          scheme.surfaceContainerHighest.withValues(alpha: 0.6),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 12, horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 4),
              Text(
                value.isNotEmpty ? value : ' ',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: color,
                ),
              ),
              Text(label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: scheme.onSurfaceVariant,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

/// Titre de section + bouton "Voir plus" à droite.
class _SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onMore;

  const _SectionHeader({required this.title, required this.onMore});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 8, 8),
      child: Row(
        children: [
          Text(title,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurfaceVariant,
              )),
          const Spacer(),
          TextButton.icon(
            onPressed: onMore,
            iconAlignment: IconAlignment.end,
            icon: const Icon(Icons.chevron_right, size: 18),
            label: const Text('Voir plus'),
          ),
        ],
      ),
    );
  }
}

/// Texte discret quand une section est vide.
class _SectionHint extends StatelessWidget {
  final String text;
  const _SectionHint({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Text(text,
          style: theme.textTheme.bodyMedium
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
    );
  }
}
