import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/app/modules/otherCar/views/details_home_other_car_view.dart';

import '../../../constants/app colors/app_colors.dart';
import '../../../constants/typography/typography.dart';
import '../controllers/second_home_other_car_controller.dart';

class SecondHomeOtherCarView extends GetView<SecondHomeOtherCarController> {
  const SecondHomeOtherCarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SecondHomeOtherCarController());
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
                          double.parse(controller.originLatitude.value),
                          double.parse(controller.originLongitude.value),
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
                          position: controller.sourceLocation),
                      Marker(
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueOrange),
                          markerId: const MarkerId("destination"),
                          position: controller.destinationLocaton),
                      Marker(
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueOrange),
                          markerId: const MarkerId("first"),
                          position: controller.first),
                      Marker(
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueOrange),
                          markerId: const MarkerId("second"),
                          position: controller.second)
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
          // const CustomSearchBar(),
          const SizedBox(height: 15),
          Column(
            children: [
              // Container(
              //   child: StreamBuilder<QuerySnapshot>(
              //       stream: FirebaseFirestore.instance
              //           .collection('bus')
              //           .snapshots(),
              //       builder: (context, snapshots) {
              //         return (snapshots.connectionState ==
              //                 ConnectionState.waiting)
              //             ? Center(
              //                 child: CircularProgressIndicator(),
              //               )
              //             : ListView.builder(
              //                 itemCount: snapshots.data!.docs.length,
              //                 itemBuilder: (context, index) {
              //                   var data = snapshots.data!.docs[index].data()
              //                       as Map<String, dynamic>;
              //                   print(data["number"]);
              //                   if (data.isEmpty) {
              //                     return ListTile(
              //                       title: Text(
              //                         data["start"],
              //                         maxLines: 1,
              //                         overflow: TextOverflow.ellipsis,
              //                         style: TextStyle(
              //                             color: Colors.black54,
              //                             fontSize: 16,
              //                             fontWeight: FontWeight.bold),
              //                       ),
              //                       subtitle: Text(
              //                         data["destination"],
              //                         maxLines: 1,
              //                         overflow: TextOverflow.ellipsis,
              //                         style: TextStyle(
              //                             color: Colors.black54,
              //                             fontSize: 16,
              //                             fontWeight: FontWeight.bold),
              //                       ),
              //                       leading: Text(
              //                         data["number"],
              //                         maxLines: 1,
              //                         overflow: TextOverflow.ellipsis,
              //                         style: TextStyle(
              //                             color: Colors.black54,
              //                             fontSize: 20,
              //                             fontWeight: FontWeight.bold),
              //                       ),
              //                     );
              //                   }
              //                 });
              //       }),
              // )
              _buildItemContainer(
                  context, "Gbaka", "Adjame, Ecole de police, Bingerville"),
              const SizedBox(
                height: 5,
              ),
              _buildItemContainer(
                  context, "Taxi Collectif", "Cocody, Bingerville"),
              const SizedBox(
                height: 5,
              ),
              _buildItemContainer(
                  context, "Gbaka", "Adjame, Riviera 2, Bingerville"),
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
