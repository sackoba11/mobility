import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/app/assets/assets.gen.dart';

import '../../../constants/app colors/app_colors.dart';
import '../../../constants/app string/app_string.dart';
import '../../widgets/apps_methodes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/illustrator.dart';
import '../../widgets/infos_car.dart';
import '../../widgets/infos_destination.dart';
import '../controllers/details_home_other_car_controller.dart';

class DetailsHomeOtherCarView extends GetView<DetilsHomeOtherCarController> {
  const DetailsHomeOtherCarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DetilsHomeOtherCarController());

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
                    polylines: {
                      Polyline(
                          width: 6,
                          polylineId: PolylineId(
                            "route",
                          ),
                          points: controller.polylineCoordinates)
                    },
                    markers: {
                      // Marker(markerId: MarkerId("way"), position: i),
                      Marker(
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueAzure),
                          markerId: const MarkerId("source"),
                          position: controller.sourceLocation),
                      Marker(
                          markerId: const MarkerId("destination"),
                          position: controller.destinationLocaton),
                      // Marker(
                      //     markerId: const MarkerId("iu"),
                      //     position: LatLng(double.parse(originLatitude),
                      //         double.parse(originLongitude)))
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
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(
                // color: AppColor.background,
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
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 184,
                          child: ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 8, right: 8),
                                child: Stack(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4.0, top: 5),
                                          child: Container(
                                            width: 2,
                                            height: 800,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                  AppColor.black,
                                                  Color(0xFFD2D3DA)
                                                ])),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Column(
                                      children: [
                                        InfosDestination(
                                          infos: "Départ",
                                        ),
                                        InfosDestination(
                                          infos: "Stop 1",
                                        ),
                                        InfosDestination(
                                          infos: "Stop 2",
                                        ),
                                        InfosDestination(
                                          infos: "Stop 3",
                                        ),
                                        InfosDestination(
                                          infos: "Stop 4",
                                        ),
                                        InfosDestination(
                                          infos: "Stop 5",
                                        ),
                                        InfosDestination(
                                          infos: "Stop 6",
                                        ),
                                        InfosDestination(
                                          infos: "Stop 7",
                                        ),
                                        InfosDestination(
                                          infos: "Stop 8",
                                        ),
                                        InfosDestination(
                                          infos: "Stop 9",
                                        ),
                                        InfosDestination(
                                          infos: "Stop 10",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 184,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.black),
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
                                  height: 10,
                                ),
                                const InfosCar(infos: "Gbaka"),
                                const InfosCar(infos: "Adjamé"),
                                const InfosCar(infos: "BingerVille"),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomButton(
                              title: "Payer",
                              ontap: () {
                                Navigator.of(context).pop();
                              },
                              radius: 15))
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
        ],
      ),
    );
  }

  Widget _buildItemContainer(
      BuildContext context, String? title, String? itinerary) {
    return GestureDetector(
      // onTap: () =>
      // _add("assets/locate.png"),
      // context.push(AppRoutes.userPage),
      child: Container(
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
                  icon: Assets.icon.toString(),
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
                        title: title!,
                        ontap: () {
                          // (secondtitle == "user")
                          secondBottomSheetUser();
                          // : secondBottomSheetDriver();
                        },
                        radius: 15),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> getLocation() async {
  //   bool serviceEnabled;

  //   LocationPermission permission;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     await Geolocator.openLocationSettings();
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   streamSubscription =
  //       Geolocator.getPositionStream().listen((Position position) {
  //     originLatitude = double.parse("${position.latitude}");
  //     originLongitude = double.parse("${position.longitude}");
  //     // getAddressFromLatLang(position);
  //     print(originLatitude);
  //     print(originLongitude);
  //   });
  // }
}
