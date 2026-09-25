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
import '../controllers/other_car_controller.dart';

/// Détail d'une gare + trajet depuis votre position (flutter_map).
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
          Obx(() {
            final garePos = LatLng(
              gare.location.lat,
              gare.location.long,
            );
            final routePoints = controller.routes
                .where((element) =>
                    element is List && element.length >= 2)
                .map((element) =>
                    lngLatToLatLng(element, 5.3502292, -3.9881887))
                .toList();
            return FlutterMap(
              mapController: controller.detailMapController,
              options: MapOptions(
                initialCenter: garePos,
                initialZoom: 14,
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
                        child: Icon(Icons.location_on,
                            color: scheme.error, size: 42),
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
                          Text("${gare.commune} • ${gare.location.label ?? 'Gare'}",
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
                          size: 18, color: scheme.onSurfaceVariant),
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
