import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/models/transport_type.dart';
import 'package:mobility/views/otherCar/controllers/other_car_controller.dart';

import '../../routes/app_pages.dart';
import '../../utils/constants/app colors/app_colors.dart';
import '../../utils/constants/typography/typography.dart';
import '../../models/gare/gare.dart';

class ItemGare extends GetView<OtherCarController> {
  final Gare gare;

  const ItemGare({
    super.key,
    required this.gare,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        controller.gare.value = gare;
        Get.toNamed(Paths.detailOtherCar);
        controller.routes.value =
            await controller.getRoutes(gare.location);
        controller.update();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColor.primary.withValues(alpha: .3),
            )),
        width: 392,
        height: 69,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: AppTypography.medium16(text: gare.name),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTypography.lightSmall(text: gare.type.label),
                AppTypography.lightSmall(text: gare.commune),
              ],
            )
          ],
        ),
      ),
    );
  }
}
