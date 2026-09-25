import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobility/common/assets/assets.gen.dart';

import '../../../common/map/fm_widgets.dart';
import '../../../common/widgets/app_button.dart';
import '../../../common/widgets/map_sheet.dart';
import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/stops_timeline.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../models/stop/stop.dart';
import '../controllers/home_bus_controller.dart';

/// Détail itinéraire d'un bus (Phase 4) : tracé + arrêts + fiche.
class DetailsHomeBusScreen extends GetView<BusController> {
  const DetailsHomeBusScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    if (controller.routes.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text("Détail bus")),
        body: AppEmptyView(
          icon: Icons.route_outlined,
          title: "Itinéraire indisponible",
          subtitle:
              "Le tracé de ce bus n'a pas pu être chargé. Vérifiez votre connexion.",
          actionLabel: "Retour",
          onAction: () => Get.back(),
        ),
      );
    }
    final first = controller.routes.first;
    final last = controller.routes.last;
    // Snapshot pour la fiche (roadMap stable) ; la carte utilise le live.
    final bus = controller.currentBus.value;
    return Scaffold(
      body: Stack(
        children: [
          // Réactif : le marqueur du bus suit la position temps réel
          // (currentBus resynchronisé par le stream Firestore) et la
          // caméra reste centrée dessus.
          Obx(() {
            final bus = controller.currentBus.value;
            final livePos = bus.position;
            final liveTarget = livePos != null
                ? LatLng(livePos.lat, livePos.long)
                : lngLatToLatLng(
                    first, 5.3502292, -3.9881887);
            if (livePos != null) {
              controller.followBusPosition(liveTarget);
            }
            final routePoints = [
              for (var i in controller.routes)
                if (i is List && i.length >= 2)
                  lngLatToLatLng(i, 5.3502292, -3.9881887)
            ];
            return FlutterMap(
              mapController: controller.detailMapController,
              options: MapOptions(
                // Centré sur le bus en direct si connu, sinon départ ligne.
                initialCenter: liveTarget,
                initialZoom: 13.5,
              ),
              children: [
                const AppTileLayer(),
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
                      point: lngLatToLatLng(
                          first, 5.3502292, -3.9881887),
                      width: 40,
                      height: 40,
                      child: GestureDetector(
                        onTap: () => Get.defaultDialog(
                          title: 'Départ — ${bus.source}',
                          middleText: 'Début de la ligne.',
                          textConfirm: 'OK',
                          confirmTextColor: Colors.white,
                          buttonColor: scheme.primary,
                          onConfirm: () => Get.back(),
                        ),
                        child: Icon(Icons.trip_origin,
                            color: scheme.primary, size: 32),
                      ),
                    ),
                    Marker(
                      point: lngLatToLatLng(
                          last, 5.3502292, -3.9881887),
                      width: 40,
                      height: 40,
                      child: GestureDetector(
                        onTap: () => Get.defaultDialog(
                          title: 'Arrivée — ${bus.destination}',
                          middleText: 'Fin de la ligne.',
                          textConfirm: 'OK',
                          confirmTextColor: Colors.white,
                          buttonColor: scheme.primary,
                          onConfirm: () => Get.back(),
                        ),
                        child: Icon(Icons.location_on,
                            color: scheme.error, size: 36),
                      ),
                    ),
                    for (var i = 0; i < bus.roadMap.length; i++)
                      Marker(
                        point: stopToLatLng(bus.roadMap[i]),
                        width: 30,
                        height: 30,
                        child: StopDot(
                          onTap: () => Get.defaultDialog(
                            title: bus.roadMap[i]
                                .displayName(i),
                            middleText:
                                'Bus ${bus.number} • ${bus.source} ↔ ${bus.destination}',
                            textConfirm: 'OK',
                            confirmTextColor: Colors.white,
                            buttonColor: scheme.primary,
                            onConfirm: () => Get.back(),
                          ),
                        ),
                      ),
                    // Position temps réel du chauffeur : épingle numérotée.
                    if (livePos != null)
                      Marker(
                        point: LatLng(livePos.lat, livePos.long),
                        width: 56,
                        height: 70,
                        alignment: Alignment.topCenter,
                        child: BusPin(
                            label: bus.number.toString()),
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
            initialSize: 0.42,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: scheme.primary,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        bus.number.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(bus.source,
                              style: theme.textTheme.titleMedium),
                          Text("↔ ${bus.destination}",
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(
                                      color: scheme.onSurfaceVariant)),
                        ],
                      ),
                    ),
                    if (bus.isActive) StatusBadge.active(context),
                  ],
                ),
                const SizedBox(height: 16),
                SheetTitle(
                  title: "Arrêts (${bus.roadMap.length})",
                  subtitle: "Principaux points du trajet.",
                ),
                const SizedBox(height: 8),
                StopsTimeline(stops: bus.roadMap),
                const SizedBox(height: 16),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Assets.vector3.image(width: 56, height: 56),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Données temps réel fournies par les chauffeurs en service.",
                        style: theme.textTheme.bodySmall?.copyWith(
                            color: scheme.onSurfaceVariant),
                      ),
                    ),
                  ],
                ),
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
