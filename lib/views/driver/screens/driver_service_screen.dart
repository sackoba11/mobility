import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../common/map/fm_widgets.dart';
import '../../../common/widgets/app_button.dart';
import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/stops_timeline.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../models/stop/stop.dart';
import '../../../routes/app_pages.dart';
import '../../shell/controllers/shell_controller.dart';
import '../controllers/service_tab_controller.dart';

/// Onglet Service chauffeur (Phase shell) : suit le service en cours
/// même après fermeture de l'app (session persistée).
class DriverServiceScreen extends GetView<ServiceTabController> {
  const DriverServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ServiceTabController>()) {
      Get.put(ServiceTabController());
    }
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Mon service')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const AppLoadingView(message: 'Chargement du service...');
        }
        if (!controller.hasService) {
          return AppEmptyView(
            icon: Icons.radio_button_checked_outlined,
            title: 'Aucun service en cours',
            subtitle: 'Choisissez un bus pour le mettre en service.',
            actionLabel: 'Voir les bus',
            onAction: () => Get.find<ShellController>().setTab(0),
          );
        }
        final bus = controller.bus.value;
        return RefreshIndicator(
          onRefresh: controller.load,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    StatusBadge.active(context, label: 'En ligne'),
                    const SizedBox(width: 8),
                    Text('Bus ${controller.busNumber.value}',
                        style: theme.textTheme.titleLarge),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  bus != null
                      ? '${bus.source} ↔ ${bus.destination}'
                      : 'Positions partagées toutes les 15 secondes.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant),
                ),
                if (bus != null) ...[
                  const SizedBox(height: 16),
                  _ServiceMap(busNumber: bus.number),
                  const SizedBox(height: 8),
                  // Témoin de fraîcheur GPS : l'heure défile <=> le flux vit.
                  Obx(() {
                    final fix = controller.lastFixAt.value;
                    final live = fix.isNotEmpty;
                    return Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: live
                                ? Colors.green
                                : theme.colorScheme.outline,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          live
                              ? 'Position live • $fix'
                              : 'En attente du signal GPS…',
                          style: theme.textTheme.bodySmall?.copyWith(
                              color: theme
                                  .colorScheme.onSurfaceVariant),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(height: 16),
                  Text('Arrêts (${bus.roadMap.length})',
                      style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  StopsTimeline(stops: bus.roadMap),
                ],
                const SizedBox(height: 16),
                if (bus != null)
                  AppButton(
                    title: 'Ouvrir la fiche du bus',
                    variant: AppButtonVariant.outline,
                    onPressed: () => Get.toNamed(Paths.driver,
                        arguments: bus),
                  ),
                const SizedBox(height: 12),
                AppButton(
                  title: 'Arrêter le service',
                  variant: AppButtonVariant.danger,
                  onPressed: () => _confirmStop(context),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Future<void> _confirmStop(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Get.defaultDialog(
      title: 'Arrêter le service',
      middleText:
          'Le bus ne sera plus visible par les passagers. Continuer ?',
      textCancel: 'Annuler',
      textConfirm: 'Arrêter',
      confirmTextColor: Colors.white,
      buttonColor: scheme.error,
      onConfirm: () async {
        Get.back();
        await controller.stopService();
      },
    );
  }
}

/// Mini-carte du service : itinéraire + arrêts (même style que côté
/// passager) + position live du chauffeur (badge numéroté).
class _ServiceMap extends StatefulWidget {
  final int busNumber;
  const _ServiceMap({required this.busNumber});

  @override
  State<_ServiceMap> createState() => _ServiceMapState();
}

class _ServiceMapState extends State<_ServiceMap> {
  /// Cadrage auto une seule fois (le suivi GPS reprend ensuite).
  bool _fittedOnce = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ServiceTabController>();
    final bus = controller.bus.value;
    final stops = bus?.roadMap ?? [];
    final stored = bus?.routeGeometry;
    final routePoints = (stored != null && stored.length >= 2)
        ? [
            for (final p in stored)
              if (p.length >= 2)
                lngLatToLatLng(p, 5.3502292, -3.9881887),
          ]
        : [
            for (final s in stops) LatLng(s.lat, s.long),
          ];
    final first = stops.isNotEmpty ? stops.first : null;
    final initial = first != null
        ? LatLng(first.lat, first.long)
        : const LatLng(5.3502292, -3.9881887);
    final scheme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 240,
        child: Stack(
          children: [
            Positioned.fill(
              child: Obx(() {
                final driverPos = LatLng(
                  double.tryParse(controller.userLat.value) ??
                      initial.latitude,
                  double.tryParse(controller.userLng.value) ??
                      initial.longitude,
                );
                controller.followDriverPosition(driverPos);
                if (!_fittedOnce && routePoints.isNotEmpty) {
                  _fittedOnce = true;
                  fitWhenReady(
                    controller.mapController,
                    [
                      ...routePoints,
                      for (final s in stops)
                        LatLng(s.lat, s.long),
                    ],
                    maxZoom: 14,
                  );
                }
                return FlutterMap(
                  mapController: controller.mapController,
                  options: MapOptions(
                    initialCenter: initial,
                    initialZoom: 13,
                    minZoom: 3,
                    maxZoom: 18,
                  ),
                  children: [
                    const AppTileLayer(),
                    if (routePoints.length >= 2)
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            points: routePoints,
                            color: scheme.primary,
                            strokeWidth: 5,
                          ),
                        ],
                      ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: driverPos,
                          width: 56,
                          height: 70,
                          alignment: Alignment.topCenter,
                          child: BusPin(label: '${widget.busNumber}'),
                        ),
                        for (var i = 0; i < stops.length; i++)
                          Marker(
                            point: LatLng(
                                stops[i].lat, stops[i].long),
                            width: 22,
                            height: 22,
                            child: RouteStopPin(
                              isStart: i == 0,
                              isEnd: i == stops.length - 1,
                              onTap: () => Get.defaultDialog(
                                title: stops[i].displayName(i),
                                middleText:
                                    'Bus ${widget.busNumber} en service',
                                textConfirm: 'OK',
                                confirmTextColor: Colors.white,
                                buttonColor: scheme.primary,
                                onConfirm: () => Get.back(),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const CurrentLocationLayer(
                      alignPositionOnUpdate: AlignOnUpdate.never,
                    ),
                    const MapCredits(),
                  ],
                );
              }),
            ),
            CenterOnMeButton(
              mapController: controller.mapController,
              heroTag: 'locate_service',
            ),
          ],
        ),
      ),
    );
  }
}

