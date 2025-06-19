import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/app/assets/assets.gen.dart';

import '../../../constants/app colors/app_colors.dart';
import '../../../models/bus/bus_from_firestore/bus.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/illustrator.dart';
import '../../widgets/infos_car.dart';
import '../controllers/driver_controller.dart';

class DriverView extends GetView<DriverController> {
  final Bus? busSelected;
  const DriverView({super.key, this.busSelected});
  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop(context) async {
      bool value = false;
      await showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              content: const Text(
                " Veuillez arrêter le service avant de revenir à la page précédente !",
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                Center(
                  child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "OK",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      )),
                )
              ],
            );
          });
      return value;
    }

    Future<bool> back() async {
      Get.back();
      return false;
    }

    Get.put(DriverController());
    return WillPopScope(
      onWillPop: () => controller.isActive.value ? onWillPop(context) : back(),
      child: Scaffold(
          backgroundColor: AppColor.background,
          body: Stack(children: [
            Container(
                color: AppColor.background,
                child: Obx(() => GoogleMap(
                      onMapCreated: controller.onMapCreated,
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      tiltGesturesEnabled: true,
                      compassEnabled: false,
                      scrollGesturesEnabled: true,
                      zoomGesturesEnabled: true,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(
                            double.parse(controller.userLatitude.value),
                            double.parse(controller.userLongitude.value),
                          ),
                          zoom: 15),
                      markers: {
                        Marker(
                          markerId: const MarkerId("UserPosition"),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueAzure),
                          position: LatLng(
                              double.parse(controller.userLatitude.value),
                              double.parse(controller.userLongitude.value)),
                        ),
                      },
                    ))),
            DraggableScrollableSheet(
              minChildSize: .3,
              maxChildSize: .6,
              initialChildSize: .45,
              builder: (context, controller) {
                return Container(
                  color: AppColor.background,
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      controller: controller,
                      child: _buildColumn(context)),
                );
              },
            )
          ])),
    );
  }

  Widget _buildColumn(BuildContext context) {
    return Column(
      children: [
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
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Illustrator(
                                      illustrator: Assets.vector3.image(),
                                      height: 35,
                                      width: 30),
                                  Text(
                                    "${busSelected!.number}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      InfosCar(infos: busSelected!.source),
                                      InfosCar(infos: busSelected!.destination),
                                    ],
                                  ),
                                  Obx(() => Text(
                                        controller.isActive.value
                                            ? "En ligne"
                                            : "Pas en service",
                                        style: controller.isActive.value
                                            ? const TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold)
                                            : const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Obx(() => CustomButton(
                            title: controller.isActive.value
                                ? "Arrêter le service"
                                : "Mettre en Service",
                            ontap: () async {
                              if (controller.isActive.value == false) {
                                controller.isActive.value = true;
                                controller.idBusController.value =
                                    await controller.activeBusService(
                                        busSelected!,
                                        controller.positionBus.value);

                                Timer.periodic(const Duration(seconds: 15),
                                    (timer) async {
                                  if (controller.isActive.value) {
                                    controller.updateBusService(
                                        busSelected!.number,
                                        controller.idBusController.value,
                                        double.parse(
                                            controller.userLatitude.value),
                                        double.parse(
                                            controller.userLongitude.value));
                                  } else {
                                    timer.cancel();
                                  }
                                });
                              } else {
                                controller.isActive.value = false;
                                await controller.deactiveBusService(
                                    busSelected!.number,
                                    controller.idBusController.value);
                              }
                            },
                            radius: 15)))
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
