import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/app/models/bus/bus_from_realTime/bus_from_db.dart';
import 'package:mobility/app/modules/bus/controllers/home_bus_controller.dart';

import '../../constants/app colors/app_colors.dart';
import '../../constants/typography/typography.dart';

class CustomListTitle extends StatelessWidget {
  final BusFromDb bus;
  final path;
  const CustomListTitle({
    super.key,
    required this.bus,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<BusController>();
    return GestureDetector(
      onTap: () async {
        Get.to(path);
        controller.currentBus.value = bus;
        controller.routes = await controller.getRoutes(bus.roadMap);
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
                AppTypography().mediumDefault(text: bus.number.toString()),
                bus.isActive == true
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
            AppTypography()
                .lightSmall(text: "${bus.source}  <->  ${bus.destination}"),
          ],
        ),
      ),
    );
  }
}
