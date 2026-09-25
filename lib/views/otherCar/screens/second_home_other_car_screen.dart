import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../common/map/fm_widgets.dart';
import '../../../common/map/poi_overlay.dart';
import '../../../common/widgets/map_sheet.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../models/gare/gare.dart';
import '../../../routes/app_pages.dart';
import '../../../services/places/poi_controller.dart';
import '../../../services/places/poi_service.dart';
import '../controllers/other_car_controller.dart';

/// Gares départ / arrivée d'un itinéraire (Phase 4).
class SecondHomeOtherCarScreen extends GetView<OtherCarController> {
  const SecondHomeOtherCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itinerary = controller.itinerary.value;
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            final List<PoiPlace> pois =
                Get.isRegistered<PoiController>()
                    ? Get.find<PoiController>().places
                    : const <PoiPlace>[];
            return FlutterMap(
              mapController: controller.secondMapController,
              options: MapOptions(
                initialCenter: const LatLng(5.3502292, -3.9881887),
                initialZoom: 12,
              ),
              children: [
                const AppTileLayer(),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(
                        itinerary.source.location.lat,
                        itinerary.source.location.long,
                      ),
                      width: 44,
                      height: 44,
                      child: GestureDetector(
                        onTap: () => _openGare(itinerary.source),
                        child: Icon(Icons.trip_origin,
                            color:
                                Theme.of(context).colorScheme.primary,
                            size: 34),
                      ),
                    ),
                    Marker(
                      point: LatLng(
                        itinerary.destination.location.lat,
                        itinerary.destination.location.long,
                      ),
                      width: 44,
                      height: 44,
                      child: GestureDetector(
                        onTap: () =>
                            _openGare(itinerary.destination),
                        child: Icon(Icons.location_on,
                            color:
                                Theme.of(context).colorScheme.error,
                            size: 38),
                      ),
                    ),
                    ...poiMarkers(pois, context),
                  ],
                ),
                const CurrentLocationLayer(
                  alignPositionOnUpdate: AlignOnUpdate.never,
                ),
                const MapCredits(),
              ],
            );
          }),
          PoiMapOverlay(
            centerOf: () =>
                controller.secondMapController.camera.center,
          ),
          MapSheet(
            initialSize: 0.38,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SheetTitle(
                  title: "Votre trajet",
                  subtitle:
                      "${itinerary.source.name} → ${itinerary.destination.name}",
                ),
                const SizedBox(height: 12),
                const _StepDot(label: "Départ"),
                GareCard(
                  gare: itinerary.source,
                  onTap: () => _openGare(itinerary.source),
                ),
                const SizedBox(height: 8),
                const _StepDot(label: "Arrivée"),
                GareCard(
                  gare: itinerary.destination,
                  onTap: () => _openGare(itinerary.destination),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openGare(Gare gare) async {
    controller.gare.value = gare;
    Get.toNamed(Paths.detailOtherCar);
    controller.routes.value =
        await controller.getRoutes(gare.location);
    controller.update();
  }
}

class _StepDot extends StatelessWidget {
  final String label;
  const _StepDot({required this.label});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 6),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: scheme.primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(label,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: scheme.onSurfaceVariant)),
        ],
      ),
    );
  }
}
