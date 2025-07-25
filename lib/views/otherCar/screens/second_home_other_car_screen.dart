import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/common/widgets/custom_shapes/containers/header_bar.dart';
import 'package:mobility/common/widgets/wrappers/body_screen_wrapper.dart';
import 'package:mobility/models/gare/gare.dart';

import '../../../utils/constants/app colors/app_colors.dart';
import '../../../common/widgets/item_gare.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../controllers/other_car_controller.dart';

class SecondHomeOtherCarScreen extends GetView<OtherCarController> {
  const SecondHomeOtherCarScreen({super.key});
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
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                expandedHeight: size.height.h * 0.6,
                flexibleSpace: Container(
                  color: AppColor.background,
                  child: Obx(() => Padding(
                        padding: EdgeInsets.only(
                          top: 24.h,
                          bottom: innerBoxIsScrolled ? 0 : 10.h,
                        ),
                        child: GoogleMap(
                          myLocationEnabled: true,
                          zoomControlsEnabled: true,
                          initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  double.parse(controller.userLatitude.value),
                                  double.parse(controller.userLongitude.value)),
                              zoom: 15),
                          markers: {
                            Marker(
                              infoWindow:
                                  const InfoWindow(title: "Votre Position"),
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
                      )),
                ),
                bottom: PreferredSize(
                  preferredSize:
                      Size.fromHeight(ZMDeviceUtils.getAppBarHeight()),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColor.background,
                        borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(CustomSizes.borderRadiusLg),
                            topRight:
                                Radius.circular(CustomSizes.borderRadiusLg))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: CustomSizes.defaultSpace),
                      child: Column(
                        children: [
                          const SizedBox(height: CustomSizes.spaceBtwItems),
                          HeaderBar(),
                        ],
                      ),
                    ),
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
