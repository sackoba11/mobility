import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../common/map/fm_widgets.dart';
import '../../../common/widgets/map_sheet.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../models/gare/gare.dart';
import '../../../routes/app_pages.dart';
import '../controllers/other_car_controller.dart';

/// Gares départ / arrivée : carte + bottom-sheet moderne.
class SecondHomeOtherCarScreen extends GetView<OtherCarController> {
  const SecondHomeOtherCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itinerary = controller.itinerary.value;
    final sourcePos = LatLng(
      itinerary.source.location.lat,
      itinerary.source.location.long,
    );
    final destPos = LatLng(
      itinerary.destination.location.lat,
      itinerary.destination.location.long,
    );
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            final userPos = controller.userLatLng;
            // Départ + arrivée + utilisateur toujours visibles.
            controller.fitSecondOnPoints([sourcePos, destPos, userPos]);
            return FlutterMap(
              mapController: controller.secondMapController,
              options: MapOptions(
                // Vue initiale = départ niveau rue (tuiles garanties) ;
                // le fit départ + arrivée + utilisateur suit post-frame.
                initialCenter: sourcePos,
                initialZoom: 13,
                minZoom: 3,
                maxZoom: 18,
              ),
              children: [
                const AppTileLayer(),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: sourcePos,
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
                      point: destPos,
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
                  ],
                ),
                // never : le recentrage auto sur l'utilisateur masquerait
                // les gares recherchées quand elles sont loin.
                const CurrentLocationLayer(
                  alignPositionOnUpdate: AlignOnUpdate.never,
                ),
                const MapCredits(),
              ],
            );
          }),
          CenterOnMeButton(
            mapController: controller.secondMapController,
            heroTag: 'locate_second_gares',
          ),
          FitPointsButton(
            mapController: controller.secondMapController,
            heroTag: 'fit_second_gares',
            pointsOf: () {
              final it = controller.itinerary.value;
              return [
                LatLng(it.source.location.lat, it.source.location.long),
                LatLng(it.destination.location.lat,
                    it.destination.location.long),
                controller.userLatLng,
              ];
            },
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
                  onTap: () =>
                      _openGare(itinerary.destination),
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
    controller.resetFits();
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
