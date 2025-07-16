import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/app colors/app_colors.dart';
import '../../controllers/other_car_controller.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key, required this.controller});

  final OtherCarController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Gbaka",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Obx(() => Checkbox(
                value: controller.filterGbaka.value,
                activeColor: AppColor.primary,
                onChanged: (value) {
                  controller.filterGbaka.value = !controller.filterGbaka.value;
                })),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Taxi",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Obx(() => Checkbox(
                value: controller.filterTaxi.value,
                activeColor: AppColor.primary,
                onChanged: (value) {
                  controller.filterTaxi.value = !controller.filterTaxi.value;
                })),
          ],
        )
      ],
    );
  }
}
