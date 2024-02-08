import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/app/modules/bus/views/details_home_bus.dart';

import '../../../constants/app colors/app_colors.dart';
import '../../widgets/custom_list_title.dart';
import '../controllers/home_bus_controller.dart';

class SecondHomeBus extends GetView<BusController> {
  const SecondHomeBus({
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
                        target: LatLng(
                            double.parse(controller.userLatitude.value),
                            double.parse(controller.userLongitude.value)),
                        zoom: 15),
                    markers: {
                      Marker(
                        markerId: const MarkerId("UserPosition"),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueAzure),
                        position: LatLng(
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
                    if (_.availableBusList.isEmpty) {
                      return Center(
                        child: Text(
                            "Aucun Bus de numéro ${_.number} n'est en cours"),
                      );
                    }
                    return Column(
                        children: _.availableBusList
                            .map(
                              (e) => Column(
                                children: [
                                  if (e["isActive"] == true)
                                    ((e['number'] ==
                                            int.parse(_.number.toString()))
                                        ? Column(
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              CustomListTitle(
                                                source: e["source"],
                                                destination: e["destination"],
                                                isActive: e["isActive"],
                                                description:
                                                    "${e["source"]}  <->  ${e["destination"]}",
                                                title: e["number"],
                                                path: const DetailsHomeBus(),
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
