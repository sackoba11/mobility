import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/models/itineraire_gare/itineraire_gare.dart';

import '../../views/otherCar/controllers/other_car_controller.dart';
import '../../views/otherCar/screens/second_home_other_car_screen.dart';
import 'custom_shapes/containers/item_card.dart';

class ItemItinerary extends GetView<OtherCarController> {
  final ItineraireGare element;

  const ItemItinerary({
    super.key,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      onTap: () {
        controller.itinerary.value = element;
        Get.to(() => const SecondHomeOtherCarScreen());
      },
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          "${element.source["name"]} <-> ${element.destination["name"]}",
        ),
      ),
      subTitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            element.type,
          ),
          Text(element.commune)
        ],
      ),
    );
  }
}
