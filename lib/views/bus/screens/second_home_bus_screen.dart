import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../common/widgets/map_sheet.dart';
import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_bus_controller.dart';

/// Bus actifs du même numéro sur carte (Phase 4).
class SecondHomeBusScreen extends GetView<BusController> {
  const SecondHomeBusScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            final followed = controller.currentBus.value;
            final pos = followed.position;
            final target = pos != null
                ? LatLng(pos.lat, pos.long)
                : LatLng(
                    double.tryParse(controller.userLatitude.value) ??
                        5.3502292,
                    double.tryParse(controller.userLongitude.value) ??
                        -3.9881887,
                  );
            return GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              tiltGesturesEnabled: true,
              compassEnabled: false,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              initialCameraPosition:
                  CameraPosition(target: target, zoom: 15),
              markers: {
                Marker(
                  infoWindow: InfoWindow(
                      title: "Bus ${followed.number} • En direct"),
                  markerId: const MarkerId("BusPosition"),
                  icon: controller.busIcons[followed.number] ??
                      BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueAzure),
                  position: target,
                ),
              },
              onMapCreated: controller.onMapCreated,
            );
          }),
          MapSheet(
            initialSize: 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SheetTitle(
                  title:
                      "Bus ${controller.currentBus.value.number} en service",
                  subtitle: controller.currentBus.value.isActive
                      ? "Suivez un bus actif pour voir son itinéraire."
                      : "Aucun bus actif — ligne de référence.",
                ),
                const SizedBox(height: 12),
                GetBuilder<BusController>(builder: (busController) {
                  final currentNumber =
                      busController.currentBus.value.number.toString();
                  final actives = busController.availableActiveBusList
                      .where((e) =>
                          e.isActive == true &&
                          e.number.toString() == currentNumber)
                      .toList();
                  if (actives.isEmpty) {
                    return AppEmptyView(
                      icon: Icons.directions_bus_outlined,
                      title: "Aucun bus n°$currentNumber en cours",
                      subtitle:
                          "Revenez plus tard ou choisissez un autre numéro.",
                    );
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: actives.length,
                    separatorBuilder: (_, _) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final bus = actives[index];
                      return BusCard(
                        bus: bus,
                        onTap: () {
                          busController.currentBus.value = bus;
                          Get.toNamed(Paths.detailHomeBus);
                          busController
                              .getRoutes(bus.roadMap)
                              .then((r) {
                            busController.routes = r;
                            busController.update();
                          });
                        },
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
