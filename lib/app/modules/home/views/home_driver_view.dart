import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/app/modules/driver/views/driver_view.dart';

import '../../../constants/app colors/app_colors.dart';
import '../../../constants/app string/app_string.dart';
import '../../../constants/typography/typography.dart';
import '../../widgets/custom_button.dart';
import '../controllers/home_driver_controller.dart';

class HomeDriverView extends GetView<HomeDriverController> {
  const HomeDriverView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeDriverController());
    return Scaffold(
        backgroundColor: AppColor.background,
        body: Stack(children: [
          Container(
              color: AppColor.background,
              child:
                  // DisplayMap(
                  //     source: Position(controller.localisation!.longitude,
                  //         controller.localisation!.latitude))
                  GoogleMap(
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
                // )   polylines: {
                //     Polyline(
                //         width: 6,
                //         polylineId: const PolylineId(
                //           "route",
                //         ),
                //         points: controller.polylineCoordinates)
                //   },
                //   markers: {
                //     // for (var i in polylineCoordinates)
                //     //   Marker(markerId: MarkerId("way"), position: i),
                //     Marker(
                //         markerId: const MarkerId("source"),
                //         position: controller.sourceLocation),
                //     Marker(
                //         markerId: const MarkerId("destination"),
                //         position: controller.destinationLocaton),
                //     Marker(
                //         markerId: const MarkerId("iu"),
                //         position: LatLng(double.parse(controller.originLatitude),
                //             double.parse(controller.originLongitude)))
                //   },
                onMapCreated: controller.onMapCreated,
              )),
          DraggableScrollableSheet(
            minChildSize: .3,
            maxChildSize: .5,
            initialChildSize: .3,
            snapAnimationDuration: const Duration(milliseconds: 400),
            builder: (context, controller) {
              return Container(
                color: AppColor.background,
                width: 430,
                height: 231,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Container(
          height: 350,
          decoration: BoxDecoration(
              color: AppColor.background,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(17), topRight: Radius.circular(17))),
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
                const SizedBox(
                  height: 5,
                ),
                CustomButton(
                    // icon: AppString.icon,
                    title: AppString.chooseCurrentLocation,
                    radius: 40,
                    ontap: () {}),
                const SizedBox(
                  height: 10,
                ),
                const Text("ou"),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: AppString.start,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                const SizedBox(
                  height: 17,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: AppString.destination,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                          title: "Démarrer",
                          ontap: () {
                            Get.to(const DriverView());
                          },
                          radius: 15),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
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
        // _buildItemContainer(context, "610", "Adjame, Bingerville"),
        // const SizedBox(
        //   height: 5,
        // ),
        // _buildItemContainer(
        //     context, '15', "Adjame Gard Nord, Gendarmerie Abobo"),
        // const SizedBox(
        //   height: 5,
        // ),
        // _buildItemContainer(
        //     context, '21', "Ecole de police Cocody, Chu de treichville "),
        // const SizedBox(
        //   height: 5,
        // ),
        // _buildItemContainer(
        //     context, "728", "Rivera 2, Yopougon Lubafrique, Bingerville")
        //   ],
        // )
      ],
    );
  }

  Widget _buildItemContainer(
      BuildContext context, String? title, String? itinerary) {
    return GestureDetector(
      // onTap: () =>
      // _add("assets/locate.png"),
      // context.push(AppRoutes.userPage),
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
