import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/views/otherCar/controllers/other_car_controller.dart';

import '../../utils/constants/typography/typography.dart';
import '../../models/gare/gare.dart';
import '../../views/otherCar/screens/details_home_other_car_screen.dart';
import 'custom_shapes/containers/item_card.dart';

class ItemGare extends GetView<OtherCarController> {
  final Gare gare;

  const ItemGare({
    super.key,
    required this.gare,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(OtherCarController());
    return ItemCard(
      onTap: () async {
        controller.gare.value = gare;
        controller.routes.value =
            await controller.getRoutes(controller.gare.value.location);
        Get.to(const DetailsHomeOtherCarScreen());
      },
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: AppTypography.medium16(text: gare.name),
      ),
      subTitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTypography.lightSmall(text: gare.type),
          AppTypography.lightSmall(text: gare.commune),
        ],
      ),
    );
  }
}
