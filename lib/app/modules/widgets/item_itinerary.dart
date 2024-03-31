import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/app/models/itineraire_gare/itineraire_gare.dart';

import '../../constants/app colors/app_colors.dart';
import '../otherCar/controllers/other_car_controller.dart';
import '../otherCar/views/second_home_other_car_view.dart';

class ItemItinerary extends GetView<OtherCarController> {
  final ItineraireGare element;

  const ItemItinerary({
    super.key,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            controller.itinerary.value = element;
            Get.to(() => const SecondHomeOtherCarView());
          },
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.white, borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              isThreeLine: true,
              titleAlignment: ListTileTitleAlignment.bottom,
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "${element.source["name"]} <-> ${element.destination["name"]}",
                ),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    element.type,
                  ),
                  Text(element.commune)
                ],
              ),
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
