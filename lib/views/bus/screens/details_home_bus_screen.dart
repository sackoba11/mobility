import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/common/assets/assets.gen.dart';

import '../../../common/widgets/custom_button_without_icon.dart';
import '../../../utils/constants/app colors/app_colors.dart';
import '../../../common/widgets/illustrator.dart';
import '../../../common/widgets/infos_car.dart';
import '../../../common/widgets/infos_destination.dart';
import '../controllers/home_bus_controller.dart';

class DetailsHomeBusScreen extends GetView<BusController> {
  const DetailsHomeBusScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (controller.routes.isEmpty) {
      return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          title: const Text("Détail bus"),
          backgroundColor: AppColor.background,
        ),
        body: const Center(
          child: Text("Itinéraire indisponible pour ce bus."),
        ),
      );
    }
    final first = controller.routes.first;
    final last = controller.routes.last;
    return Scaffold(
        backgroundColor: AppColor.background,
        body: Stack(children: [
          Container(
              color: AppColor.background,
              child: GoogleMap(
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                tiltGesturesEnabled: true,
                compassEnabled: false,
                scrollGesturesEnabled: true,
                zoomGesturesEnabled: true,
                initialCameraPosition: CameraPosition(
                    target: LatLng(
                      double.tryParse(first[1].toString()) ?? 5.3502292,
                      double.tryParse(first[0].toString()) ?? -3.9881887,
                    ),
                    zoom: 13.5),
                polylines: {
                  Polyline(
                      width: 6,
                      polylineId: const PolylineId(
                        "route",
                      ),
                      points: [
                        for (var i in controller.routes) LatLng(i[1], i[0])
                      ])
                },
                markers: {
                  Marker(
                    markerId: const MarkerId("UserPosition"),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueAzure),
                    position: LatLng(
                        double.tryParse(controller.userLatitude.value) ??
                            5.3502292,
                        double.tryParse(controller.userLongitude.value) ??
                            -3.9881887),
                  ),
                  Marker(
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen),
                      markerId: const MarkerId("source"),
                      position: LatLng(
                        (first[1] is num)
                            ? (first[1] as num).toDouble()
                            : double.tryParse(first[1].toString()) ??
                                5.3502292,
                        (first[0] is num)
                            ? (first[0] as num).toDouble()
                            : double.tryParse(first[0].toString()) ??
                                -3.9881887,
                      )),
                  Marker(
                      markerId: const MarkerId("destination"),
                      position: LatLng(
                        (last[1] is num)
                            ? (last[1] as num).toDouble()
                            : double.tryParse(last[1].toString()) ??
                                5.3502292,
                        (last[0] is num)
                            ? (last[0] as num).toDouble()
                            : double.tryParse(last[0].toString()) ??
                                -3.9881887,
                      )),
                  for (var i in controller.currentBus.value.roadMap)
                    Marker(
                        markerId: const MarkerId("route"),
                        position: LatLng(i.lat, i.long))
                },
                onMapCreated: controller.onMapCreated,
              )),
          DraggableScrollableSheet(
            initialChildSize: .4,
            builder: (context, controller) {
              return Container(
                color: AppColor.background,
                width: 430,
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
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
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
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
                  Column(children: [
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
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
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                    AppColor.primary,
                                                    const Color(0xFFD2D3DA)
                                                  ])),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: (controller
                                                .currentBus.value.roadMap
                                                .map((e) => InfosDestination(
                                                    infos:
                                                        "Arrêt ${e.toString()}")))
                                            .toList(),
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
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColor.primary),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, top: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Illustrator(
                                      illustrator: Assets.vector3.image(),
                                      height: 35,
                                      width: 30),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InfosCar(
                                    infos: controller.currentBus.value.number
                                        .toString(),
                                  ),
                                  InfosCar(
                                    infos: controller.currentBus.value.source
                                        .toString(),
                                  ),
                                  InfosCar(
                                    infos: controller
                                        .currentBus.value.destination
                                        .toString(),
                                  ),
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
                            child: CustomButtonWithoutIcon(
                          title: "Retour",
                          onPressed: () {
                            Get.back();
                          },
                        ))
                      ],
                    )
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
