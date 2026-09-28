import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/app_search_field.dart';
import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_bus_controller.dart';

/// Mini-dashboard Bus SOTRA : accès rapide aux fonctionnalités
/// (bus en service, lignes, arrêts) + recherche par numéro.
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
      body: Column(
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
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: AppSearchField(
              controller: controller.textEditingController,
              hintText: "Numéro du bus (ex. 610)",
              keyboardType: TextInputType.number,
              onChanged: (value) async {
                final text = value.trim();
                // Une nouvelle recherche repart de toutes les lignes.
                if (controller.lineFilter.value != 'all') {
                  controller.setLineFilter('all');
                }
                if (text.isNotEmpty) {
                  final parsed = int.tryParse(text);
                  if (parsed == null) {
                    controller.searchActiveBus.clear();
                    controller.availableActiveBusList.clear();
                    return;
                  }
                  await controller.getBusByNumber(parsed);
                } else {
                  await controller.getAllBus();
                }
              },
            ),
          ),
          // --- Raccourcis dashboard ---
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: Obx(
              () => Row(
                children: [
                  Expanded(
                    child: _DashCard(
                      icon: Icons.route_outlined,
                      value: '${controller.lineCount}',
                      label: 'Lignes',
                      color: theme.colorScheme.primary,
                      selected: controller.lineFilter.value == 'all',
                      onTap: () => _applyFilter('all'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _DashCard(
                      icon: Icons.directions_bus_filled,
                      value: '${controller.activeCount}',
                      label: 'En service',
                      color: Colors.green,
                      selected: controller.lineFilter.value == 'active',
                      onTap: () => _applyFilter('active'),
                    ),
                  ),
                  const SizedBox(width: 10),

                  Expanded(
                    child: _DashCard(
                      icon: Icons.location_on_outlined,
                      value: '',
                      label: 'Arrêts',
                      color: theme.colorScheme.secondary,
                      onTap: () => Get.toNamed(Paths.stops),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Obx(() {
              final active = controller.lineFilter.value == 'active';
              final n = controller.dashboardBuses.length;
              return Text(
                active ? 'Bus en service ($n)' : 'Lignes de bus ($n)',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              );
            }),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const AppLoadingView(message: "Recherche des bus...");
              }
              if (controller.errorMessage.value.isNotEmpty &&
                  controller.availableActiveBusList.isEmpty) {
                return AppErrorView(
                  message: controller.errorMessage.value,
                  onRetry: () => controller.getAllBus(),
                );
              }
              final buses = controller.dashboardBuses;
              if (buses.isEmpty) {
                final query = controller.textEditingController.text.trim();
                final activeOnly = controller.lineFilter.value == 'active';
                return AppEmptyView(
                  icon: activeOnly
                      ? Icons.directions_bus_outlined
                      : Icons.search_off_outlined,
                  title: activeOnly && query.isEmpty
                      ? "Aucun bus en service"
                      : "Aucun bus disponible",
                  subtitle: activeOnly && query.isEmpty
                      ? "Revenez plus tard ou explorez les lignes."
                      : "Essayez un autre numéro ou actualisez la liste.",
                  actionLabel: activeOnly && query.isEmpty
                      ? "Voir les lignes"
                      : null,
                  onAction: activeOnly && query.isEmpty
                      ? () => controller.setLineFilter('all')
                      : null,
                );
              }
              return RefreshIndicator(
                onRefresh: controller.getAllBus,
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                  itemCount: buses.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final bus = buses[index];
                    return BusCard(
                      bus: bus,
                      onTap: () {
                        // Fiche ligne (onglets Aller / Retour) : le suivi
                        // live part de là via "Suivre en direct".
                        controller.currentBus.value = bus;
                        Get.toNamed(Paths.lineDetail);
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

  /// Applique un filtre du dashboard (réinitialise la recherche).
  Future<void> _applyFilter(String filter) async {
    controller.textEditingController.clear();
    controller.setLineFilter(filter);
    await controller.getAllBus();
  }
}

/// Carte de raccourci du dashboard (valeur + libellé + icône).
class _DashCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  const _DashCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Material(
      color: selected
          ? color.withValues(alpha: 0.16)
          : scheme.surfaceContainerHighest.withValues(alpha: 0.6),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? color : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 4),
              // Ligne valeur toujours rendue (insécable si vide)
              // pour des cartes strictement de même hauteur.
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
