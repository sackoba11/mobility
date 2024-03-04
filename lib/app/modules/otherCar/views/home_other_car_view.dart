import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/app/modules/otherCar/views/second_home_other_car_view.dart';

import '../../../constants/app colors/app_colors.dart';
import '../../../constants/app string/app_string.dart';
import '../../../constants/typography/typography.dart';
import '../../widgets/custom_button.dart';
import '../controllers/other_car_controller.dart';

class HomeOtherCarView extends GetView<OtherCarController> {
  const HomeOtherCarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OtherCarController());
    return Scaffold(
        backgroundColor: AppColor.background,
        body: Stack(children: [
          Container(
              color: AppColor.background,
              child: const GoogleMap(
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                tiltGesturesEnabled: true,
                compassEnabled: false,
                scrollGesturesEnabled: true,
                zoomGesturesEnabled: true,
                initialCameraPosition: CameraPosition(
                    target: LatLng(5.349127, -3.988434), zoom: 15),
                // polylines: {
                //   Polyline(
                //       width: 6,
                //       polylineId: PolylineId(
                //         "route",
                //       ),
                //       points: polylineCoordinates)
                // },
                // markers: {
                //   // for (var i in polylineCoordinates)
                //   //   Marker(markerId: MarkerId("way"), position: i),
                //   Marker(
                //       markerId: const MarkerId("source"),
                //       position: sourceLocation),
                //   Marker(
                //       markerId: const MarkerId("destination"),
                //       position: destinationLocaton),
                //   Marker(
                //       markerId: const MarkerId("iu"),
                //       position: LatLng(double.parse(originLatitude),
                //           double.parse(originLongitude)))
                // },
                // onMapCreated: onMapCreated,
              )),
          DraggableScrollableSheet(
            minChildSize: .3,
            maxChildSize: .5,
            initialChildSize: .3,
            snapAnimationDuration: const Duration(milliseconds: 400),
            builder: (context, controller) {
              return Container(
                color: AppColor.white,
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

// / Future<String> showGoogleAutoComplete() async {
  //   var kGoogleApiKey = apikey;

  //   Prediction? p = await PlacesAutocomplete(
  //       offset: 0,
  //       radius: 1000,
  //       strictbounds: false,
  //       region: "us",
  //       context: context,
  //       apiKey: kGoogleApiKey,
  //       mode: Mode.overlay, // Mode.fullscreen
  //       language: "en",
  //       components: [Component(Component.country, "en")],
  //       types: ["(cities)"],
  //       hint: "Search City");

  //   return p!.description!;
  // }
  // String place =
  //                                       await showGoogleAutoComplete();
  //                                   sourcecontroller.text = place;
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
                        title: "Trouvez les vehicules disponibles",
                        ontap: () {
                          Get.to(const SecondHomeOtherCarView());
                        },
                        radius: 15),
                  )
                ],
              )
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
            ],
          )
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
