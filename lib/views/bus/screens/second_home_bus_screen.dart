import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../common/map/fm_widgets.dart';
import '../../../common/widgets/map_sheet.dart';
import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../models/bus/bus_from_realTime/bus_from_db.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_bus_controller.dart';

/// Bus actifs du même numéro : carte + bottom-sheet moderne.
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
            final userPos = LatLng(
              double.tryParse(controller.userLatitude.value) ?? 5.3502292,
              double.tryParse(controller.userLongitude.value) ?? -3.9881887,
            );
            final target = pos != null
                ? LatLng(pos.lat, pos.long)
                : userPos;
            if (pos != null) {
              // Recadre bus + utilisateur (une fois par déplacement réel) :
              // les deux restent visibles, zoom manuel préservé ensuite.
              controller.fitSecondOnBoth(target, userPos);
            }
            return FlutterMap(
              mapController: controller.secondMapController,
              options: MapOptions(
                // Vue initiale = point recherché niveau rue (tuiles
                // garanties) ; le fit bus + utilisateur suit post-frame.
                initialCenter: target,
                initialZoom: 15,
                minZoom: 3,
                maxZoom: 18,
              ),
              children: [
                const AppTileLayer(),
                MarkerLayer(
                  markers: [
                    // Épingle bus UNIQUEMENT si position live connue :
                    // sinon elle se poserait sur l'utilisateur (point bleu
                    // seul dans ce cas).
                    if (pos != null)
                      Marker(
                        point: target,
                        width: 56,
                        height: 70,
                        alignment: Alignment.topCenter,
                        child: BusPin(
                            label: followed.displayNumber),
                      ),
                  ],
                ),
                // never : le recentrage auto sur l'utilisateur masquerait
                // le bus recherché quand il est loin.
                const CurrentLocationLayer(
                  alignPositionOnUpdate: AlignOnUpdate.never,
                ),
                const MapCredits(),
              ],
            );
          }),
          CenterOnMeButton(
            mapController: controller.secondMapController,
            heroTag: 'locate_second_bus',
          ),
          FitPointsButton(
            mapController: controller.secondMapController,
            heroTag: 'fit_second_bus',
            pointsOf: () {
              final pos = controller.currentBus.value.position;
              final user = LatLng(
                double.tryParse(controller.userLatitude.value) ?? 5.3502292,
                double.tryParse(controller.userLongitude.value) ?? -3.9881887,
              );
              if (pos == null) return [user];
              return [LatLng(pos.lat, pos.long), user];
            },
          ),
          MapSheet(
            initialSize: 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SheetTitle(
                  title:
                      "Bus ${controller.currentBus.value.displayNumber} en service",
                  subtitle: controller.currentBus.value.isActive
                      ? "Suivez un bus actif pour voir son itinéraire."
                      : "Aucun bus actif — ligne de référence.",
                ),
                const SizedBox(height: 12),
                GetBuilder<BusController>(
                    builder: (busController) {
                  final currentNumber = busController
                      .currentBus.value.number
                      .toString();
                  final actives = busController
                      .availableActiveBusList
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
                          busController.resetDetailFit();
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
