import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/models/itineraire_gare/itineraire_gare.dart';

import '../../models/transport_type.dart';
import '../../routes/app_pages.dart';
import '../../utils/constants/app colors/app_colors.dart';
import '../../views/otherCar/controllers/other_car_controller.dart';

class ItemItinerary extends GetView<OtherCarController> {
  final ItineraireGare element;

  const ItemItinerary({
    super.key,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    final sourceName = element.source.name;
    final destName = element.destination.name;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            controller.itinerary.value = element;
            Get.toNamed(Paths.secondOtherCar);
          },
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.white, borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              isThreeLine: true,
              titleAlignment: ListTileTitleAlignment.bottom,
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text("$sourceName <-> $destName"),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(element.type.label),
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
