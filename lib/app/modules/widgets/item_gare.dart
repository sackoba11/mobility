import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/app/models/gare/gare.dart';

import '../../constants/app colors/app_colors.dart';
import '../otherCar/controllers/other_car_controller.dart';
import '../otherCar/views/second_home_other_car_view.dart';

class ItemGare extends GetView<OtherCarController> {
  final Gare element;

  const ItemGare({
    super.key,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            controller.gare.value = element;

            Get.to(() => const SecondHomeOtherCarView());
            debugPrint(element.name);
          },
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.white, borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(element.name),
              trailing: Text(element.commune),
              subtitle: Text(element.type),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
