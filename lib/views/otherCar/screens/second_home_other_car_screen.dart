import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../utils/constants/app colors/app_colors.dart';
import '../../../common/widgets/item_gare.dart';
import '../controllers/other_car_controller.dart';

class SecondHomeOtherCarScreen extends GetView<OtherCarController> {
  const SecondHomeOtherCarScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
                            double.tryParse(controller.userLatitude.value) ??
                                5.3502292,
                            double.tryParse(controller.userLongitude.value) ??
                                -3.9881887),
                        zoom: 15),
                    markers: {
                      Marker(
                        infoWindow: const InfoWindow(title: "Votre Position"),
                        markerId: const MarkerId("UserPosition"),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueAzure),
                        position: LatLng(
                            double.tryParse(controller.userLatitude.value) ??
                                5.3502292,
                            double.tryParse(controller.userLongitude.value) ??
                                -3.9881887),
                      ),
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
              ItemGare(
                gare: controller.itinerary.value.source,
              ),
              const SizedBox(
                height: 5,
              ),
              ItemGare(
                gare: controller.itinerary.value.destination,
              ),
            ],
          )
        ],
      ),
    );
  }
}
