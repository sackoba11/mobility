import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_list_title.dart';
import '../../../../utils/constants/app colors/app_colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/home_bus_controller.dart';
import '../second_home_bus_screen.dart';

class BodyScreen extends StatelessWidget {
  const BodyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BusController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Obx(() {
            if (controller.isConnect.value == false) {
              return const Center(
                child: Text("Vous n'êtes pas connecté à internet"),
              );
            }
            if (controller.isLoading.value == true) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.primary,
                ),
              );
            }
            if (controller.availableActiveBusList.isEmpty) {
              return const Center(
                child: Text("Pas de bus disponibles"),
              );
            }
            return GetBuilder<BusController>(
              init: BusController(),
              builder: (busController) {
                if (busController.availableActiveBusList.isEmpty) {
                  return const Center(
                    child: Text("Aucun Bus trouvé"),
                  );
                }
                return ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: busController.availableActiveBusList
                        .map(
                          (e) => Column(
                            children: [
                              CustomListTitle(
                                  bus: e, path: const SecondHomeBusScreen()),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        )
                        .toList());
              },
            );
          }),
        ],
      ),
    );
  }
}
