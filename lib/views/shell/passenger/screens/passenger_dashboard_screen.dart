import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../home/controllers/home_user_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../bus/controllers/home_bus_controller.dart';
import '../../../otherCar/controllers/other_car_controller.dart';
import '../../../stops/controllers/stops_controller.dart';
import '../../controllers/shell_controller.dart';
import '../../../../models/bus/bus_from_realTime/bus_from_db.dart';
import '../../../../models/transit_stop/transit_stop.dart';

/// Accueil passager : dashboard général (compteurs, autour de moi,
/// accès directs aux transports).
class PassengerDashboardScreen extends GetView<HomeUserController> {
  const PassengerDashboardScreen({super.key});

  String _firstName(User? user) {
    final name = user?.displayName?.trim().split(' ').firstOrNull;
    if (name != null && name.isNotEmpty) return name;
    return user?.email?.split('@').firstOrNull ?? '';
  }

  String _greeting() {
    final hour = DateTime.now().hour;
    if (hour >= 18 || hour < 5) return 'Bonsoir';
    return 'Bonjour';
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
        child: RefreshIndicator(
          onRefresh: () async {
            if (Get.isRegistered<BusController>()) {
              await Get.find<BusController>().getAllBus();
            }
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.isEmpty
                      ? '${_greeting()} 👋'
                      : '${_greeting()} $name 👋',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Où allez-vous aujourd\'hui ?',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                // --- Compteurs ---
                Obx(() {
                  final bus = Get.find<BusController>();
                  final car = Get.find<OtherCarController>();
                  final stops = Get.find<StopsController>();
                  // Lit les RxList pour suivre les chargements.
                  final active = bus.activeBusList.length;
                  final lines = bus.lineCount;
                  final gares =
                      car.gares.length + car.itineraries.length;
                  final stopsCount = stops.stops.length;
                  return GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.78,
                    children: [
                      _StatCard(
                        icon: Icons.directions_bus_filled,
                        value: '$active',
                        label: 'En service',
                        color: Colors.green,
                        onTap: () => Get.find<ShellController>()
                            .setTab(1),
                      ),
                      _StatCard(
                        icon: Icons.route_outlined,
                        value: '$lines',
                        label: 'Lignes',
                        color: scheme.primary,
                        onTap: () => Get.find<ShellController>()
                            .setTab(1),
                      ),
                      _StatCard(
                        icon: Icons.location_on_outlined,
                        value: '$gares',
                        label: 'Gares',
                        color: scheme.secondary,
                        onTap: () => Get.find<ShellController>()
                            .setTab(2),
                      ),
                      _StatCard(
                        icon: Icons.directions_bus_outlined,
                        value: '$stopsCount',
                        label: 'Arrêts',
                        color: scheme.tertiary,
                        onTap: () =>
                            Get.toNamed(Paths.stops),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 20),
                // --- Autour de moi ---
                Text('Autour de moi',
                    style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800)),
                const SizedBox(height: 10),
                Obx(() {
                  final bus = Get.find<BusController>();
                  final stops = Get.find<StopsController>();
                  // Suivi des chargements + positions.
                  bus.activeBusList.length;
                  bus.userLatitude.value;
                  stops.stops.length;
                  final nearStop =
                      stops.nearestStops(limit: 1).firstOrNull;
                  final nearBus =
                      bus.nearestActive(limit: 1).firstOrNull;
                  if (nearStop == null && nearBus == null) {
                    return const _AroundMeHint(
                        text:
                            'Activez la position pour voir ce qui est proche de vous.');
                  }
                  return _AroundMeCard(
                    stopName: nearStop?.name,
                    stopDetail: nearStop == null
                        ? null
                        : () {
                            final d =
                                stops.distanceTo(nearStop);
                            return d == null
                                ? nearStop.kindLabel
                                : '${nearStop.kindLabel} • ${_formatDistance(d)}';
                          }(),
                    busLabel: nearBus == null
                        ? null
                        : 'Bus ${nearBus.displayNumber}',
                    busDetail: nearBus == null
                        ? null
                        : () {
                            final d =
                                bus.liveDistance(nearBus) ??
                                    bus.minStopDistance(nearBus);
                            final dir = nearBus.directionLabel;
                            final base =
                                '${nearBus.source} → ${nearBus.destination}';
                            final withDir = dir.isEmpty
                                ? base
                                : '$base • $dir';
                            return d == null
                                ? withDir
                                : '$withDir • ${_formatDistance(d)}';
                          }(),
                    onStopTap: nearStop == null
                        ? null
                        : () {
                            stops.selected.value = nearStop;
                            Get.toNamed(Paths.stopDetail);
                          },
                    onBusTap: nearBus == null
                        ? null
                        : () {
                            bus.currentBus.value = nearBus;
                            Get.toNamed(Paths.lineDetail);
                          },
                  );
                }),
                const SizedBox(height: 20),
                Text('Transports',
                    style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800)),
                const SizedBox(height: 10),
                _ShortcutCard(
                  icon: Icons.directions_bus_outlined,
                  title: 'Bus Sotra',
                  subtitle: 'Lignes et bus en direct',
                  onTap: () =>
                      Get.find<ShellController>().setTab(1),
                ),
                const SizedBox(height: 12),
                _ShortcutCard(
                  icon: Icons.local_taxi_outlined,
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
                    color: scheme.primaryContainer
                        .withValues(alpha: 0.5),
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
                          style: theme.textTheme.bodySmall
                              ?.copyWith(
                            color: scheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String _formatDistance(double meters) {
  if (meters < 1000) return 'à ${meters.round()} m';
  return 'à ${(meters / 1000).toStringAsFixed(1)} km';
}

/// Mini-compteur du dashboard (valeur + libellé).
class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _StatCard({
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
              vertical: 10, horizontal: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 22),
              const SizedBox(height: 2),
              Text(value,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: color,
                  )),
              Text(label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: scheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}

/// Message discret quand "autour de moi" est vide.
class _AroundMeHint extends StatelessWidget {
  final String text;
  const _AroundMeHint({required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest
            .withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(text, style: theme.textTheme.bodyMedium),
    );
  }
}

/// Carte "autour de moi" : arrêt le plus proche + bus en service
/// le plus proche (lignes absentes si non disponibles).
class _AroundMeCard extends StatelessWidget {
  final String? stopName;
  final String? stopDetail;
  final String? busLabel;
  final String? busDetail;
  final VoidCallback? onStopTap;
  final VoidCallback? onBusTap;

  const _AroundMeCard({
    this.stopName,
    this.stopDetail,
    this.busLabel,
    this.busDetail,
    this.onStopTap,
    this.onBusTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest
            .withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          if (stopName != null)
            ListTile(
              leading: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: scheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.near_me_outlined,
                    color: scheme.onPrimaryContainer),
              ),
              title: Text(stopName!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall),
              subtitle: stopDetail == null
                  ? null
                  : Text(stopDetail!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
              trailing: Icon(Icons.chevron_right,
                  color: scheme.onSurfaceVariant),
              onTap: onStopTap,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          if (busLabel != null)
            ListTile(
              leading: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.directions_bus_filled,
                    color: Colors.green),
              ),
              title: Text(busLabel!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall),
              subtitle: busDetail == null
                  ? null
                  : Text(busDetail!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
              trailing: Icon(Icons.chevron_right,
                  color: scheme.onSurfaceVariant),
              onTap: onBusTap,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
        ],
      ),
    );
  }
}

class _ShortcutCard extends StatelessWidget {
  final IconData icon;
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
                child: Icon(
                  icon,
                  size: 35,
                  color: theme.colorScheme.onPrimary,
                  weight: 5,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: theme.textTheme.titleMedium),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
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
