import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../models/transit_stop/transit_stop.dart';
import '../../../routes/app_pages.dart';
import '../../stops/controllers/stops_controller.dart';
import '../controllers/home_bus_controller.dart';

/// Mini-dashboard Bus : compteurs + aperçus (5 plus proches) vers les
/// pages dédiées (lignes, en service, arrêts).
class HomeBusScreen extends GetView<BusController> {
  const HomeBusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bus Sotra"),
        actions: [
          IconButton(
            tooltip: "Actualiser",
            icon: const Icon(Icons.refresh),
            onPressed: () async => controller.getAllBus(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.getAllBus,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                child: Text(
                  "Retrouvez votre bus en temps réel.",
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
                      child: Obx(
                        () => _DashCard(
                          icon: Icons.directions_bus_filled,
                          value: '${controller.activeCount}',
                          label: 'En service',
                          color: Colors.green,
                          onTap: () => Get.toNamed(Paths.activeBuses),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Obx(
                        () => _DashCard(
                          icon: Icons.route_outlined,
                          value: '${controller.lineCount}',
                          label: 'Lignes',
                          color: theme.colorScheme.primary,
                          onTap: () => Get.toNamed(Paths.busLines),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Obx(
                        () => _DashCard(
                          icon: Icons.location_on_outlined,
                          value: '${Get.find<StopsController>().stopsCount}',
                          label: 'Arrêts',
                          color: theme.colorScheme.secondary,
                          onTap: () => Get.toNamed(Paths.stops),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // --- En service près de vous ---
              _SectionHeader(
                title: 'En service près de vous',
                onMore: () => Get.toNamed(Paths.activeBuses),
              ),
              Obx(() {
                final buses = controller.nearestActive();
                if (buses.isEmpty) {
                  return const _SectionHint(
                    text: 'Aucun bus en service pour le moment.',
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  itemCount: buses.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final bus = buses[index];
                    return BusCard(
                      bus: bus,
                      onTap: () {
                        controller.currentBus.value = bus;
                        controller.resetSecondFit();
                        controller.resetDetailFit();
                        Get.toNamed(Paths.secondHomeBus);
                        controller.getRoutes(bus.roadMap).then((r) {
                          controller.routes = r;
                          controller.update();
                        });
                      },
                    );
                  },
                );
              }),
              // --- Lignes proches ---
              _SectionHeader(
                title: 'Lignes proches',
                onMore: () => Get.toNamed(Paths.busLines),
              ),
              Obx(() {
                if (controller.isLoading.value) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: AppLoadingView(message: 'Recherche des lignes...'),
                  );
                }
                final buses = controller.nearestLines();
                if (buses.isEmpty) {
                  return const _SectionHint(
                    text: 'Aucune ligne pour le moment.',
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  itemCount: buses.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final bus = buses[index];
                    return BusCard(
                      bus: bus,
                      onTap: () {
                        controller.currentBus.value = bus;
                        Get.toNamed(Paths.lineDetail);
                      },
                    );
                  },
                );
              }),

              // --- Arrêts proches ---
              _SectionHeader(
                title: 'Arrêts proches',
                onMore: () => Get.toNamed(Paths.stops),
              ),
              Obx(() {
                final stopsCtrl = Get.find<StopsController>();
                if (stopsCtrl.isLoading.value && stopsCtrl.stops.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: AppLoadingView(message: 'Recherche des arrêts...'),
                  );
                }
                final stops = stopsCtrl.nearestStops();
                if (stops.isEmpty) {
                  return const _SectionHint(
                    text: 'Aucun arrêt pour le moment.',
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                  itemCount: stops.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final stop = stops[index];
                    final dist = stopsCtrl.distanceTo(stop);
                    return _NearbyStopTile(
                      stop: stop,
                      distance: dist,
                      onTap: () {
                        stopsCtrl.selected.value = stop;
                        Get.toNamed(Paths.stopDetail);
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
}

/// Carte compteur du dashboard (hauteurs égales via ligne valeur
/// toujours rendue).
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
      color: scheme.surfaceContainerHighest.withValues(alpha: 0.6),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: scheme.onSurfaceVariant,
                ),
              ),
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
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
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
      child: Text(
        text,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

/// Tuile d'arrêt proche (nom + distance).
class _NearbyStopTile extends StatelessWidget {
  final TransitStop stop;
  final double? distance;
  final VoidCallback onTap;

  const _NearbyStopTile({
    required this.stop,
    required this.distance,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final icon = switch (stop.kind) {
      'gare' => Icons.train_outlined,
      'boat' => Icons.directions_boat_outlined,
      _ => Icons.directions_bus_outlined,
    };
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: scheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: scheme.onPrimaryContainer),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stop.name,
                      style: theme.textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${stop.kindLabel}${distance == null ? '' : ' • ${StopsController.formatDistance(distance!)}'}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
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
