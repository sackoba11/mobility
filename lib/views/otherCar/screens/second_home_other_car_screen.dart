import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../common/widgets/map_sheet.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../models/gare/gare.dart';
import '../../../routes/app_pages.dart';
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
          Obx(() => GoogleMap(
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                tiltGesturesEnabled: true,
                compassEnabled: false,
                scrollGesturesEnabled: true,
                zoomGesturesEnabled: true,
                initialCameraPosition: CameraPosition(
                    target: LatLng(
                        double.tryParse(
                                controller.userLatitude.value) ??
                            5.3502292,
                        double.tryParse(
                                controller.userLongitude.value) ??
                            -3.9881887),
                    zoom: 15),
                markers: {
                  Marker(
                    infoWindow:
                        const InfoWindow(title: "Votre position"),
                    markerId: const MarkerId("UserPosition"),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueAzure),
                    position: LatLng(
                        double.tryParse(
                                controller.userLatitude.value) ??
                            5.3502292,
                        double.tryParse(
                                controller.userLongitude.value) ??
                            -3.9881887),
                  ),
                },
                onMapCreated: controller.onMapCreated,
              )),
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
