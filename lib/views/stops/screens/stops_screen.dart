import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/app_search_field.dart';
import '../../../common/widgets/state_views.dart';
import '../../../models/bus/bus_from_realTime/bus_from_db.dart';
import '../../../models/transit_stop/transit_stop.dart';
import '../../../routes/app_pages.dart';
import '../../bus/controllers/home_bus_controller.dart';
import '../controllers/stops_controller.dart';

const _kinds = [
  ('all', 'Tous'),
  ('stop', 'Arrêts'),
  ('gare', 'Gares'),
  ('boat', 'Bateaux'),
];

/// Liste des arrêts et gares : recherche + filtres + proximité.
class StopsScreen extends GetView<StopsController> {
  const StopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Arrêts & gares')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: AppSearchField(
              controller: controller.searchController,
              hintText: 'Rechercher un arrêt, une gare…',
              onChanged: controller.onSearchChanged,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            // Lecture synchrone dans le builder (pas dans l'itemBuilder
            // différé) pour que l'Obx suive kindFilter.
            child: Obx(() {
              final selectedKind = controller.kindFilter.value;
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _kinds.length,
                separatorBuilder: (_, _) =>
                    const SizedBox(width: 8),
                itemBuilder: (context, i) {
                  final kind = _kinds[i];
                  return ChoiceChip(
                    label: Text(kind.$2),
                    selected: selectedKind == kind.$1,
                    onSelected: (_) =>
                        controller.setKind(kind.$1),
                  );
                },
              );
            }),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const AppLoadingView(
                    message: 'Chargement des arrêts...');
              }
              if (controller.errorMessage.value.isNotEmpty &&
                  controller.visible.isEmpty) {
                return AppErrorView(
                  message: controller.errorMessage.value,
                  onRetry: () => controller.load(),
                );
              }
              if (controller.visible.isEmpty) {
                return const AppEmptyView(
                  icon: Icons.directions_bus_outlined,
                  title: 'Aucun arrêt trouvé',
                  subtitle: 'Modifiez la recherche ou les filtres.',
                );
              }
              return RefreshIndicator(
                onRefresh: controller.load,
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                  itemCount: controller.visible.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final stop = controller.visible[index];
                    final dist =
                        controller.distanceTo(stop);
                    final buses =
                        controller.busesThrough(stop);
                    return _StopCard(
                      name: stop.name,
                      subtitle:
                          '${stop.kindLabel}${dist == null ? '' : ' • ${StopsController.formatDistance(dist)}'}',
                      kind: stop.kind,
                      buses: buses,
                      onTap: () {
                        controller.selected.value = stop;
                        Get.toNamed(Paths.stopDetail);
                      },
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _StopCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final String kind;
  final List<BusFromDb> buses;
  final VoidCallback onTap;

  const _StopCard({
    required this.name,
    required this.subtitle,
    required this.kind,
    this.buses = const [],
    required this.onTap,
  });

  IconData get _icon => switch (kind) {
        'gare' => Icons.train_outlined,
        'boat' => Icons.directions_boat_outlined,
        _ => Icons.directions_bus_outlined,
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    // Lignes desservant l'arrêt, avec leur sens (Aller/Retour).
    final shown = buses.take(3).toList();
    final extra = buses.length - shown.length;
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: scheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(_icon,
                    color: scheme.onPrimaryContainer, size: 22),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(name,
                        style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 1),
                    Text(subtitle,
                        style: theme.textTheme.bodySmall?.copyWith(
                            color: scheme.onSurfaceVariant)),
                    if (shown.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          for (final b in shown)
                            _LineChip(bus: b),
                          if (extra > 0)
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2),
                              decoration: BoxDecoration(
                                color: scheme.surfaceContainerHighest
                                    .withValues(alpha: 0.7),
                                borderRadius:
                                    BorderRadius.circular(12),
                              ),
                              child: Text('+$extra',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      color: scheme
                                          .onSurfaceVariant)),
                            ),
                        ],
                      ),
                    ],
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

/// Pastille "N° · Sens" (tap -> fiche ligne).
class _LineChip extends StatelessWidget {
  final BusFromDb bus;
  const _LineChip({required this.bus});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final dir = bus.directionLabel;
    final label =
        dir.isEmpty ? bus.displayNumber : '${bus.displayNumber} · $dir';
    return GestureDetector(
      onTap: () {
        if (!Get.isRegistered<BusController>()) return;
        final busController = Get.find<BusController>();
        busController.currentBus.value = bus;
        Get.toNamed(Paths.lineDetail);
      },
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: scheme.primaryContainer.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(label,
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: scheme.onPrimaryContainer)),
      ),
    );
  }
}
