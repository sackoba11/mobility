import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/common/assets/assets.gen.dart';

import '../../../common/widgets/app_button.dart';
import '../../../common/widgets/map_sheet.dart';
import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/stops_timeline.dart';
import '../../../common/widgets/transport_cards.dart';
import '../controllers/home_bus_controller.dart';

/// Détail itinéraire d'un bus (Phase 4) : tracé + arrêts + fiche.
class DetailsHomeBusScreen extends GetView<BusController> {
  const DetailsHomeBusScreen({
    super.key,
  });

  double _coord(dynamic v, double fallback) {
    if (v is num) return v.toDouble();
    return double.tryParse(v.toString()) ?? fallback;
  }

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
                : LatLng(
                    _coord(first[1], 5.3502292),
                    _coord(first[0], -3.9881887),
                  );
            if (livePos != null) {
              controller.followBusPosition(liveTarget);
            }
            return GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            tiltGesturesEnabled: true,
            compassEnabled: false,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
                // Centré sur le bus en direct si connu, sinon départ ligne.
                target: livePos != null
                    ? LatLng(livePos.lat, livePos.long)
                    : LatLng(
                        _coord(first[1], 5.3502292),
                        _coord(first[0], -3.9881887),
                      ),
                zoom: 13.5),
            polylines: {
              Polyline(
                width: 6,
                color: scheme.primary,
                polylineId: const PolylineId("route"),
                points: [
                  for (var i in controller.routes)
                    if (i is List && i.length >= 2)
                      LatLng(_coord(i[1], 5.3502292),
                          _coord(i[0], -3.9881887))
                ],
              )
            },
            markers: {
              Marker(
                markerId: const MarkerId("UserPosition"),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueAzure),
                position: LatLng(
                    double.tryParse(controller.userLatitude.value) ??
                        5.3502292,
                    double.tryParse(controller.userLongitude.value) ??
                        -3.9881887),
              ),
              Marker(
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen),
                infoWindow: InfoWindow(
                    title: "Départ — ${bus.source}",
                    snippet: "Début de la ligne"),
                markerId: const MarkerId("source"),
                position: LatLng(
                    _coord(first[1], 5.3502292),
                    _coord(first[0], -3.9881887)),
              ),
              Marker(
                  infoWindow: InfoWindow(
                      title: "Arrivée — ${bus.destination}",
                      snippet: "Fin de la ligne"),
                  markerId: const MarkerId("destination"),
                position: LatLng(
                    _coord(last[1], 5.3502292),
                    _coord(last[0], -3.9881887)),
              ),
              for (var i in bus.roadMap)
                Marker(
                    infoWindow: InfoWindow(
                        title: i.label ?? "Arrêt",
                        snippet:
                            "Bus ${bus.number} • ${bus.source} ↔ ${bus.destination}"),
                    markerId: MarkerId("stop_${i.lat}_${i.long}"),
                    position: LatLng(i.lat, i.long)),
              // Position temps réel du chauffeur : badge avec le numéro
              // du bus (chargé une fois, orange en attendant).
              if (livePos != null)
                Marker(
                  infoWindow: InfoWindow(
                      title: "Bus ${bus.number} • En direct",
                      snippet: "Position temps réel du chauffeur"),
                  icon: controller.busIcons[bus.number] ??
                      BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueOrange),
                  markerId: const MarkerId("BusLive"),
                  position: LatLng(livePos.lat, livePos.long),
                ),
            },
            onMapCreated: controller.onMapCreated,
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
