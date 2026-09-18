import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/common/assets/assets.gen.dart';
import 'package:mobility/models/transport_type.dart';

import '../../../common/widgets/app_button.dart';
import '../../../common/widgets/map_sheet.dart';
import '../../../common/widgets/transport_cards.dart';
import '../controllers/other_car_controller.dart';

/// Détail d'une gare + trajet depuis votre position (Phase 4).
class DetailsHomeOtherCarScreen extends GetView<OtherCarController> {
  const DetailsHomeOtherCarScreen({super.key});

  LatLng _latLng(dynamic lat, dynamic lng) {
    double parseCoord(dynamic v, double fallback) {
      if (v is num) return v.toDouble();
      return double.tryParse(v.toString()) ?? fallback;
    }

    return LatLng(parseCoord(lat, 5.3502292), parseCoord(lng, -3.9881887));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final gare = controller.gare.value;
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => GoogleMap(
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                tiltGesturesEnabled: true,
                compassEnabled: false,
                scrollGesturesEnabled: true,
                zoomGesturesEnabled: true,
                initialCameraPosition: CameraPosition(
                    target: _latLng(controller.userLatitude.value,
                        controller.userLongitude.value),
                    zoom: 15),
                polylines: {
                  if (controller.routes.isNotEmpty)
                    Polyline(
                      width: 6,
                      color: scheme.primary,
                      polylineId: const PolylineId("route"),
                      points: controller.routes
                          .where((element) =>
                              element is List && element.length >= 2)
                          .map((element) =>
                              _latLng(element[1], element[0]))
                          .toList(),
                    )
                },
                markers: {
                  Marker(
                      infoWindow:
                          const InfoWindow(title: "Votre position"),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueAzure),
                      markerId: const MarkerId("source"),
                      position: _latLng(
                          controller.userLatitude.value,
                          controller.userLongitude.value)),
                  Marker(
                      infoWindow: InfoWindow(title: "Gare ${gare.name}"),
                      markerId: const MarkerId("destination"),
                      position: _latLng(
                        gare.location.lat,
                        gare.location.long,
                      )),
                },
                onMapCreated: controller.onMapCreated,
              )),
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
