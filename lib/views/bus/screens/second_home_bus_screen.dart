import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/constants/app colors/app_colors.dart';
import '../../../common/widgets/custom_list_title.dart';
import '../controllers/home_bus_controller.dart';

class SecondHomeBusScreen extends GetView<BusController> {
  const SecondHomeBusScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        body: Stack(children: [
          Container(
              padding: const EdgeInsets.only(top: 20),
              color: AppColor.background,
              child: Obx(() {
                final pos = controller.currentBus.value.position;
                final fallback = LatLng(
                  double.tryParse(controller.userLatitude.value) ??
                      5.3502292,
                  double.tryParse(controller.userLongitude.value) ??
                      -3.9881887,
                );
                final target = pos != null
                    ? LatLng(pos.lat, pos.long)
                    : fallback;
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
                      markerId: const MarkerId("BusPosition"),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueAzure),
                      position: target,
                    ),
                  },
                  onMapCreated: controller.onMapCreated,
                );
              })),
          DraggableScrollableSheet(
            initialChildSize: .3,
            builder: (context, scrollController) {
              return Container(
                color: AppColor.white,
                width: 430,
                child: _buildColumn(context),
              );
            },
          )
        ]));
  }

  Widget _buildColumn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Container(
            width: 40,
            height: 5,
            decoration: ShapeDecoration(
              color: const Color(0xFFA7AEB1),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xFFA7AEB1)),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
          Expanded(child: GetBuilder<BusController>(
              builder: (busController) {
            if (busController.availableActiveBusList.isEmpty) {
              return Center(
                child: Text(
                    "Aucun Bus de numéro ${busController.currentBus.value.number} n'est en cours"),
              );
            }
            final currentNumber =
                busController.currentBus.value.number.toString();
            final actives = busController.availableActiveBusList
                .where((e) =>
                    e.isActive == true &&
                    e.number.toString() == currentNumber)
                .toList();
            if (actives.isEmpty) {
              return Center(
                child: Text(
                    "Aucun Bus de numéro $currentNumber n'est en cours"),
              );
            }
            return ListView.builder(
              itemCount: actives.length,
              itemBuilder: (context, index) {
                final e = actives[index];
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    CustomListTitle(
                        bus: e, routeName: Paths.detailHomeBus),
                  ],
                );
              },
            );
          })),
        ],
      ),
    );
  }
}
