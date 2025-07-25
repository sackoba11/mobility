import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/common/assets/assets.gen.dart';
import 'package:mobility/common/widgets/appbar/custom_sliver_appbar_with_map.dart';
import 'package:mobility/common/widgets/wrappers/body_screen_wrapper.dart';

import '../../../common/widgets/custom_button_without_icon.dart';
import '../../../utils/constants/app colors/app_colors.dart';
import '../../../common/widgets/illustrator.dart';
import '../../../common/widgets/infos_car.dart';
import '../controllers/other_car_controller.dart';

class DetailsHomeOtherCarScreen extends GetView<OtherCarController> {
  const DetailsHomeOtherCarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OtherCarController());
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: AppColor.background,
        body: NestedScrollView(
            floatHeaderSlivers: true,
            physics: NeverScrollableScrollPhysics(),
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                CustomSliverAppBarWithMap(
                    expandedHeight: size.height.h * 0.52,
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
                                    .map((element) =>
                                        LatLng(element[1], element[0]))
                                    .toList())
                          },
                          markers: {
                            Marker(
                                infoWindow:
                                    const InfoWindow(title: "Votre position"),
                                icon: BitmapDescriptor.defaultMarkerWithHue(
                                    BitmapDescriptor.hueAzure),
                                markerId: const MarkerId("source"),
                                position: LatLng(
                                  double.parse(controller.userLatitude.value),
                                  double.parse(controller.userLongitude.value),
                                )),
                            Marker(
                                infoWindow: InfoWindow(
                                    title:
                                        "Gare ${controller.gare.value.name}"),
                                markerId: const MarkerId("destination"),
                                position: LatLng(
                                  controller.gare.value.location["lat"],
                                  controller.gare.value.location["long"],
                                )),
                          },
                          onMapCreated: controller.onMapCreated,
                        )))
              ];
            },
            body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: BodyScreenWrapper(
                  children: [
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
                                  InfosCar(
                                      infos: controller.gare.value.commune),
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
                    CustomButtonWithoutIcon(
                      title: "Retour",
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ))));
  }
}
