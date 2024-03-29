import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/app/modules/otherCar/views/details_home_other_car_view.dart';

import '../../../constants/app colors/app_colors.dart';
import '../../../constants/typography/typography.dart';
import '../controllers/other_car_controller.dart';

class SecondHomeOtherCarView extends GetView<OtherCarController> {
  const SecondHomeOtherCarView({Key? key}) : super(key: key);
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
                          double.parse(
                              controller.gare.value.location["lat"].toString()),
                          double.parse(controller.gare.value.location["long"]
                              .toString()),
                        ),
                        zoom: 15),
                    //   // polylines: {
                    //   //   Polyline(
                    //   //       width: 6,
                    //   //       polylineId: PolylineId(
                    //   //     )    "route",
                    //   //       ),
                    //   //       points: polylineCoordinates)
                    //   // },
                    markers: {
                      Marker(
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueOrange),
                          markerId: const MarkerId("source"),
                          position: LatLng(
                            double.parse(controller.gare.value.location["lat"]
                                .toString()),
                            double.parse(controller.gare.value.location["long"]
                                .toString()),
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
                color: AppColor.white,
                width: 430,
                height: 431,
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
          const SizedBox(height: 20),
          const SizedBox(height: 15),
          Column(
            children: [
              _buildItemContainer(context, controller.gare.value.name,
                  controller.gare.value.type),
              const SizedBox(
                height: 5,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildItemContainer(
      BuildContext context, String? title, String? itinerary) {
    return GestureDetector(
      onTap: () {
        Get.to(const DetailsHomeOtherCarView());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColor.black.withOpacity(.3),
            )),
        width: 392,
        height: 69,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTypography().medium16(text: title),
            AppTypography().lightSmall(text: itinerary)
          ],
        ),
      ),
    );
  }
}
