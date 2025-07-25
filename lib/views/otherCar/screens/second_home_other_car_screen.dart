import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/common/widgets/wrappers/body_screen_wrapper.dart';
import 'package:mobility/models/gare/gare.dart';

import '../../../common/widgets/appbar/custom_sliver_appbar_with_map.dart';
import '../../../utils/constants/app colors/app_colors.dart';
import '../../../common/widgets/item_gare.dart';
import '../controllers/other_car_controller.dart';

class SecondHomeOtherCarScreen extends GetView<OtherCarController> {
  const SecondHomeOtherCarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OtherCarController());
    return Scaffold(
        backgroundColor: AppColor.background,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              CustomSliverAppBarWithMap(
                child: Obx(
                  () => GoogleMap(
                    myLocationEnabled: true,
                    zoomControlsEnabled: true,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(
                            double.parse(controller.userLatitude.value),
                            double.parse(controller.userLongitude.value)),
                        zoom: 15),
                    markers: {
                      Marker(
                        infoWindow: const InfoWindow(title: "Votre Position"),
                        markerId: const MarkerId("UserPosition"),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueAzure),
                        position: LatLng(
                            double.parse(controller.userLatitude.value),
                            double.parse(controller.userLongitude.value)),
                      ),
                    },
                    onMapCreated: controller.onMapCreated,
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
              child: BodyScreenWrapper(
            children: [
              Column(
                children: [
                  ItemGare(
                    gare: Gare.fromJson(controller.itinerary.value.source),
                  ),
                  ItemGare(
                    gare: Gare.fromJson(controller.itinerary.value.destination),
                  ),
                ],
              )
            ],
          )),
        ));
  }
}
