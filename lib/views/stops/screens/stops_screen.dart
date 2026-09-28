import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/app_search_field.dart';
import '../../../common/widgets/state_views.dart';
import '../../../models/transit_stop/transit_stop.dart';
import '../../../routes/app_pages.dart';
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
                    return _StopCard(
                      name: stop.name,
                      subtitle:
                          '${stop.kindLabel}${dist == null ? '' : ' • ${StopsController.formatDistance(dist)}'}',
                      kind: stop.kind,
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
  final VoidCallback onTap;

  const _StopCard({
    required this.name,
    required this.subtitle,
    required this.kind,
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
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: scheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(_icon,
                    color: scheme.onPrimaryContainer),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: theme.textTheme.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
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
