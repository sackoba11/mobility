import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/common/assets/assets.gen.dart';

import '../../../utils/constants/app colors/app_colors.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/illustrator.dart';
import '../../../common/widgets/infos_car.dart';
import '../controllers/other_car_controller.dart';

class DetailsHomeOtherCarScreen extends GetView<OtherCarController> {
  const DetailsHomeOtherCarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OtherCarController());

    return Scaffold(
        backgroundColor: AppColor.background,
        body: Stack(children: [
          Container(
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
                    polylines: {
                      Polyline(
                          width: 6,
                          polylineId: const PolylineId(
                            "route",
                          ),
                          points: controller.routes
                              .map((element) => LatLng(element[1], element[0]))
                              .toList())
                    },
                    markers: {
                      Marker(
                          infoWindow: const InfoWindow(title: "Votre position"),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueAzure),
                          markerId: const MarkerId("source"),
                          position: LatLng(
                            double.parse(controller.userLatitude.value),
                            double.parse(controller.userLongitude.value),
                          )),
                      Marker(
                          infoWindow: InfoWindow(
                              title: "Gare ${controller.gare.value.name}"),
                          markerId: const MarkerId("destination"),
                          position: LatLng(
                            controller.gare.value.location["lat"],
                            controller.gare.value.location["long"],
                          )),
                    },
                    onMapCreated: controller.onMapCreated,
                  ))),
          DraggableScrollableSheet(
            minChildSize: .3,
            maxChildSize: .5,
            initialChildSize: .3,
            snapAnimationDuration: const Duration(milliseconds: 400),
            builder: (context, controller) {
              return Container(
                color: AppColor.background,
                width: 430,
                height: 350,
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    controller: controller,
                    child: _buildColumn(context)),
              );
            },
          )
        ]));
  }

  Widget _buildColumn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          Container(
            // height: 350,
            decoration: BoxDecoration(
                color: AppColor.background,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(17),
                    topRight: Radius.circular(17))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.primary),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Illustrator(
                                    illustrator: Assets.gbaka.image(),
                                    height: 35,
                                    width: 30),
                                const SizedBox(
                                  height: 5,
                                ),
                                InfosCar(infos: controller.gare.value.name),
                                InfosCar(infos: controller.gare.value.type),
                                InfosCar(infos: controller.gare.value.commune),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomButton(
                              title: "Retour",
                              ontap: () {
                                Navigator.of(context).pop();
                              },
                              radius: 15)),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
