import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/models/bus/bus_from_realTime/bus_from_db.dart';
import 'package:mobility/views/bus/controllers/home_bus_controller.dart';

import '../../utils/constants/app colors/app_colors.dart';
import '../../utils/constants/typography/typography.dart';

/// Item bus. Navigue via route nommée APRÈS avoir positionné l'état
/// (currentBus + routes) pour éviter l'écran vide / race.
class CustomListTitle extends StatelessWidget {
  final BusFromDb bus;
  final String routeName;
  const CustomListTitle({
    super.key,
    required this.bus,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final controller = Get.find<BusController>();
        controller.currentBus.value = bus;
        Get.toNamed(routeName);
        // Chargement async après navigation pour une UI réactive ;
        // DetailsHomeBusScreen gère routes.isEmpty avec un fallback.
        controller.routes = await controller.getRoutes(bus.roadMap);
        controller.update();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColor.primary.withValues(alpha: .3),
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
                AppTypography.mediumDefault(text: bus.number.toString()),
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
            AppTypography
                .lightSmall(text: "${bus.source}  <->  ${bus.destination}"),
          ],
        ),
      ),
    );
  }
}
