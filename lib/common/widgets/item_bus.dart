import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/models/bus/bus_from_realTime/bus_from_db.dart';
import 'package:mobility/views/bus/controllers/home_bus_controller.dart';

import '../../utils/constants/typography/typography.dart';
import 'custom_shapes/containers/item_card.dart';

class ItemBus extends StatelessWidget {
  final BusFromDb bus;
  final dynamic path;
  const ItemBus({
    super.key,
    required this.bus,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<BusController>();
    return ItemCard(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTypography.mediumDefault(text: bus.number.toString()),
          bus.isActive == true
              ? const Text(
                  "Actif",
                  style: TextStyle(fontSize: 10, color: Colors.green),
                )
              : Container()
        ],
      ),
      subTitle: AppTypography.lightSmall(
          text: "${bus.source}  <->  ${bus.destination}"),
      onTap: () async {
        Get.to(path);
        controller.currentBus.value = bus;
        controller.routes = await controller.getRoutes(bus.roadMap);
      },
    );
  }
}
