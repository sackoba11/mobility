import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobility/common/assets/assets.gen.dart';

import '../../../common/map/fm_widgets.dart';
import '../../../common/help_functions/help_functions.dart';
import '../../../common/widgets/app_button.dart';
import '../../../common/widgets/map_sheet.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../utils/constants/app colors/app_colors.dart';
import '../../../models/bus/bus_from_firestore/bus.dart';
import '../../../models/stop/stop.dart';
import '../controllers/driver_controller.dart';

/// Mise en service d'un bus (Phase 4) : activation + diffusion position.
class DriverScreen extends GetView<DriverController> {
  final Bus? busSelected;
  const DriverScreen({super.key, this.busSelected});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<DriverController>()) {
      Get.put(DriverController());
    }
    final args = Get.arguments;
    final Bus? busFromArgs = args is Bus ? args : null;
    final bus = busSelected ?? busFromArgs;
    if (bus == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Chauffeur")),
        body: const Center(child: Text("Aucun bus sélectionné.")),
      );
    }
    // Pas de blocage retour : le service reste visible et pilotable depuis
    // l'onglet Service. L'unicité (un seul bus actif) est garantie par
    // DriverController.startTracking (clôture du précédent).
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: _DriverMap(bus: bus),
          ),
          CenterOnMeButton(
            mapController: controller.mapController,
            heroTag: 'locate_driver',
          ),
          MapSheet(
            initialSize: 0.42,
            minSize: 0.3,
            child: _ServicePanel(bus: bus),
          ),
        ],
      ),
    );
  }
}

/// Carte de la fiche chauffeur : itinéraire à mettre en service +
/// arrêts (même style que côté passager) + position du chauffeur.
class _DriverMap extends StatefulWidget {
  final Bus bus;
  const _DriverMap({required this.bus});

  @override
  State<_DriverMap> createState() => _DriverMapState();
}

class _DriverMapState extends State<_DriverMap> {
  /// Cadrage auto une seule fois (le suivi GPS reprend ensuite).
  bool _fittedOnce = false;

  void _showStop(BuildContext context, int i) {
    final scheme = Theme.of(context).colorScheme;
    Get.defaultDialog(
      title: widget.bus.roadMap[i].displayName(i),
      middleText:
          'Bus ${widget.bus.displayNumber} • ${widget.bus.source} ↔ ${widget.bus.destination}',
      textConfirm: 'OK',
      confirmTextColor: Colors.white,
      buttonColor: scheme.primary,
      onConfirm: () => Get.back(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DriverController>();
    final scheme = Theme.of(context).colorScheme;
    final stored = widget.bus.routeGeometry;
    final routePoints = (stored != null && stored.length >= 2)
        ? [
            for (final p in stored)
              if (p.length >= 2)
                lngLatToLatLng(p, 5.3502292, -3.9881887),
          ]
        : [
            for (final s in widget.bus.roadMap)
              LatLng(s.lat, s.long),
          ];
    return Obx(() {
      final target = LatLng(
        double.tryParse(controller.userLatitude.value) ?? 5.3502292,
        double.tryParse(controller.userLongitude.value) ?? -3.9881887,
      );
      // Suivi caméra comme côté passager.
      controller.followDriverPosition(target);
      if (!_fittedOnce && routePoints.isNotEmpty) {
        _fittedOnce = true;
        // Vue initiale serrée sur l'itinéraire (arrêts distinguables).
        fitWhenReady(
          controller.mapController,
          [
            ...routePoints,
            for (final s in widget.bus.roadMap)
              LatLng(s.lat, s.long),
          ],
          maxZoom: 14,
        );
      }
      final center = routePoints.isNotEmpty
          ? routePoints.first
          : target;
      return FlutterMap(
        mapController: controller.mapController,
        options: MapOptions(
          initialCenter: center,
          initialZoom: 14,
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
                  strokeWidth: 6,
                ),
              ],
            ),
          MarkerLayer(
            markers: [
              for (var i = 0;
                  i < widget.bus.roadMap.length;
                  i++)
                Marker(
                  point: LatLng(widget.bus.roadMap[i].lat,
                      widget.bus.roadMap[i].long),
                  width: 22,
                  height: 22,
                  child: RouteStopPin(
                    isStart: i == 0,
                    isEnd:
                        i == widget.bus.roadMap.length - 1,
                    onTap: () => _showStop(context, i),
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
    });
  }
}

class _ServicePanel extends GetView<DriverController> {
  final Bus bus;
  const _ServicePanel({required this.bus});

  /// Vrai uniquement si LE bus affiché est celui en service
  /// (et non un autre bus du même chauffeur).
  bool _isActiveHere() =>
      controller.isActive.value &&
      controller.activeBusNumber.value == bus.number;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          final activeNumber = controller.activeBusNumber.value;
          if (controller.isActive.value &&
              activeNumber != -1 &&
              activeNumber != bus.number) {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: scheme.secondaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Service en cours sur le bus $activeNumber. "
                "Mettre ce bus en service clôturera l'autre.",
                style: theme.textTheme.bodySmall?.copyWith(
                    color: scheme.onSecondaryContainer),
              ),
            );
          }
          return const SizedBox.shrink();
        }),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Assets.vector3.image(width: 56, height: 56),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Bus ${bus.displayNumber}",
                          style: theme.textTheme.titleLarge),
                      const SizedBox(width: 8),
                      Obx(() => _isActiveHere()
                          ? StatusBadge.active(context,
                              label: "En ligne")
                          : StatusBadge.line(
                              context, "Hors service")),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text("${bus.source} ↔ ${bus.destination}",
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color: scheme.onSurfaceVariant)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: scheme.secondaryContainer.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            "Votre position est partagée avec les passagers toutes les 15 secondes pendant le service.",
            style: theme.textTheme.bodySmall?.copyWith(
                color: scheme.onSecondaryContainer),
          ),
        ),
        const SizedBox(height: 16),
        Obx(() {
          final activeHere = _isActiveHere();
          return AppButton(
            title: activeHere
                ? "Arrêter le service"
                : "Mettre en service",
            variant: activeHere
                ? AppButtonVariant.danger
                : AppButtonVariant.primary,
            onPressed: () => _toggleService(),
          );
        }),
      ],
    );
  }

  Future<void> _toggleService() async {
    // Toujours décider par rapport AU bus affiché, pas à l'état global.
    if (!_isActiveHere()) {
      final id = await controller.startTracking(bus);
      if (id == "Echec" || id.isEmpty) {
        HelpFunctions.customSnackbar(
          title: "Mise en service impossible",
          message: controller.lastError.value.isNotEmpty
              ? controller.lastError.value
              : "Vérifiez votre connexion puis réessayez.",
          colorText: AppColor.error,
          icon: Icons.error_outline,
        );
      }
    } else {
      await controller.stopTracking();
    }
  }
}
