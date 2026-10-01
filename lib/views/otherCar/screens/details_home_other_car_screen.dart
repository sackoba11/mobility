import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobility/common/assets/assets.gen.dart';
import 'package:mobility/models/transport_type.dart';

import '../../../common/map/fm_widgets.dart';
import '../../../common/widgets/app_button.dart';
import '../../../common/widgets/map_sheet.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../models/gare/gare.dart';
import '../controllers/other_car_controller.dart';

/// Détail d'une gare + trajet : carte + bottom-sheet moderne.
class DetailsHomeOtherCarScreen extends GetView<OtherCarController> {
  const DetailsHomeOtherCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final gare = controller.gare.value;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: _GareMap(gare: gare, scheme: scheme),
          ),
          CenterOnMeButton(
            mapController: controller.detailMapController,
            heroTag: 'locate_detail_gare',
          ),
          FitPointsButton(
            mapController: controller.detailMapController,
            heroTag: 'fit_detail_gare',
            pointsOf: () {
              final g = controller.gare.value;
              final loc = g.location;
              final pts = <LatLng>[
                if (loc != null) LatLng(loc.lat, loc.long),
                controller.userLatLng,
              ];
              for (final e in controller.routes) {
                if (e is List && e.length >= 2) {
                  pts.add(lngLatToLatLng(e, 5.3502292, -3.9881887));
                }
              }
              return pts;
            },
          ),
          MapSheet(
            initialSize: 0.38,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Assets.gbaka.image(width: 64, height: 64),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(gare.name,
                              style: theme.textTheme.titleLarge),
                          const SizedBox(height: 4),
                          Text(
                              "${gare.commune} • ${gare.location?.label ?? 'Gare'}",
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(
                                      color: scheme.onSurfaceVariant)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                StatusBadge.line(context, gare.type.label),
                if (controller.routes.isEmpty) ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.info_outline,
                          size: 18,
                          color: scheme.onSurfaceVariant),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Tracé indisponible — vérifiez votre connexion.",
                          style: theme.textTheme.bodySmall?.copyWith(
                              color: scheme.onSurfaceVariant),
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 16),
                AppButton(
                  title: "Retour",
                  variant: AppButtonVariant.outline,
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Carte du détail gare (extrait pour lisibilité).
class _GareMap extends GetView<OtherCarController> {
  final Gare gare;
  final ColorScheme scheme;

  const _GareMap({required this.gare, required this.scheme});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final loc = gare.location;
      final garePos = loc != null
          ? LatLng(loc.lat, loc.long)
          : controller.userLatLng;
      final userPos = controller.userLatLng;
      final routePoints = controller.routes
          .where((element) =>
              element is List && element.length >= 2)
          .map((element) =>
              lngLatToLatLng(element, 5.3502292, -3.9881887))
          .toList();
      // Gare (si connue) + utilisateur (+ tracé) toujours visibles.
      controller.fitDetailOnPoints(
          [if (loc != null) garePos, userPos, ...routePoints]);
      return FlutterMap(
        mapController: controller.detailMapController,
        options: MapOptions(
          // Vue initiale = gare niveau rue (tuiles garanties) ; le fit
          // gare + utilisateur suit post-frame.
          initialCenter: garePos,
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
              if (loc != null)
                Marker(
                  point: garePos,
                  width: 48,
                  height: 48,
                  child: GestureDetector(
                    onTap: () => Get.defaultDialog(
                      title: 'Gare ${gare.name}',
                      middleText:
                          '${gare.type.label} • ${gare.commune}',
                      textConfirm: 'OK',
                      confirmTextColor: Colors.white,
                      buttonColor: scheme.primary,
                      onConfirm: () => Get.back(),
                    ),
                  child: ZoomScaled.square(
                    baseSize: 42,
                    child: Icon(Icons.location_on,
                        color: scheme.error, size: 42),
                  ),
                  ),
                ),
            ],
          ),
          // never : le recentrage auto sur l'utilisateur masquerait
          // la gare recherchée quand elle est loin.
          const CurrentLocationLayer(
            alignPositionOnUpdate: AlignOnUpdate.never,
          ),
          const MapCredits(),
        ],
      );
    });
  }
}
