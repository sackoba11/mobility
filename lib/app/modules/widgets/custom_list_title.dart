import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/app/modules/bus/controllers/home_bus_controller.dart';

import '../../constants/app colors/app_colors.dart';
import '../../constants/typography/typography.dart';

class CustomListTitle extends StatelessWidget {
  final int title;
  final String description;
  final String? source;
  final String? destination;
  final List<dynamic>? roadMap;
  final path;
  final bool isActive;
  const CustomListTitle(
      {super.key,
      required this.description,
      required this.title,
      required this.path,
      required this.isActive,
      this.roadMap,
      this.source = "source",
      this.destination = "destination"});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<BusController>();
    return GestureDetector(
      onTap: () async {
        Get.to(path);
        controller.number = RxInt(title);
        controller.sourceBus = RxString(source!);
        controller.destinationBus = RxString(destination!);
        controller.road = roadMap!;
        controller.routes = await controller.getRoutes(controller.road);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColor.black.withOpacity(.3),
            )),
        width: double.infinity,
        height: 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTypography().mediumDefault(text: title.toString()),
                isActive == true
                    ? const Text(
                        "Actif",
                        style: TextStyle(fontSize: 10, color: Colors.green),
                      )
                    : Container()
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            AppTypography().lightSmall(text: description)
          ],
        ),
      ),
    );
  }
}
