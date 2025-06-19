import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/views/bus/screens/details_home_bus_screen.dart';

import '../../../utils/constants/app colors/app_colors.dart';
import '../../../common/widgets/custom_list_title.dart';
import '../controllers/home_bus_controller.dart';

class SecondHomeBusScreen extends GetView<BusController> {
  const SecondHomeBusScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(BusController());
    return Scaffold(
        backgroundColor: AppColor.background,
        body: Stack(children: [
          Container(
              padding: const EdgeInsets.only(top: 20),
              color: AppColor.background,
              child: Obx(() => GoogleMap(
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    tiltGesturesEnabled: true,
                    compassEnabled: false,
                    scrollGesturesEnabled: true,
                    zoomGesturesEnabled: true,
                    initialCameraPosition: CameraPosition(
                        target: (controller.currentBus.value.position) != null
                            ? LatLng(controller.currentBus.value.position!.lat,
                                controller.currentBus.value.position!.long)
                            : LatLng(
                                double.parse(controller.userLatitude.value),
                                double.parse(controller.userLongitude.value)),
                        zoom: 15),
                    markers: {
                      Marker(
                        markerId: const MarkerId("BusPosition"),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueAzure),
                        position: (controller.currentBus.value.position) != null
                            ? LatLng(controller.currentBus.value.position!.lat,
                                controller.currentBus.value.position!.long)
                            : LatLng(
                                double.parse(controller.userLatitude.value),
                                double.parse(controller.userLongitude.value)),
                      ),
                    },
                    onMapCreated: controller.onMapCreated,
                  ))),
          DraggableScrollableSheet(
            initialChildSize: .3,
            builder: (context, controller) {
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
          Expanded(
              child: GetBuilder<BusController>(
                  init: BusController(),
                  initState: (_) {},
                  builder: (_) {
                    if (_.availableActiveBusList.isEmpty) {
                      return Center(
                        child: Text(
                            "Aucun Bus de numéro ${_.currentBus.value.number} n'est en cours"),
                      );
                    }
                    return Column(
                        children: _.availableActiveBusList
                            .map(
                              (e) => Column(
                                children: [
                                  if (e.isActive == true)
                                    ((e.number ==
                                            int.parse(_.currentBus.value.number
                                                .toString()))
                                        ? Column(
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              CustomListTitle(
                                                bus: e,
                                                path:
                                                    const DetailsHomeBusScreen(),
                                              ),
                                            ],
                                          )
                                        : Container())
                                ],
                              ),
                            )
                            .toList());
                  })),
        ],
      ),
    );
  }
}
