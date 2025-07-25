import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/item_bus.dart';
import '../../../common/widgets/custom_search_bar.dart';
import '../../../utils/constants/app colors/app_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../controllers/home_bus_controller.dart';
import 'second_home_bus_screen.dart';
import '../../../common/widgets/wrappers/body_screen_wrapper.dart';
import '../../../common/widgets/appbar/custom_sliver_appbar.dart';

class HomeBusScreen extends GetView<BusController> {
  const HomeBusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BusController());
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColor.background,
        appBar: CustomAppBar(
          showBackArrow: true,
          backgroundColor: AppColor.transparent,
          actions: [
            IconButton(
              iconSize: 26,
              icon: Icon(
                Icons.restart_alt,
                color: AppColor.white,
              ),
              onPressed: () async {
                await controller.getAllBus();
              },
            ),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                CustomSliverAppBar(
                    title: "Entrer le numero du bus à rechercher.",
                    bottomWiget: GetBuilder<BusController>(
                      init: BusController(),
                      builder: (busController) {
                        return CustomSearchBar(
                            hintText: "Recherche par numéro",
                            textEditingController:
                                busController.textEditingController,
                            onChanged: (value) async {
                              if (busController
                                  .textEditingController.text.isNotEmpty) {
                                await busController.getBusByNumber(int.tryParse(
                                    busController.textEditingController.text)!);
                                busController.availableBusList =
                                    busController.searchActiveBus;
                              } else {
                                await busController.getAllBus();
                              }
                            });
                      },
                    )),
              ];
            },
            body: SingleChildScrollView(
              child: BodyScreenWrapper(
                children: [
                  Obx(() {
                    // if (controller.isConnect.value == false) {
                    //   return const Center(
                    //     child: Text("Vous n'êtes pas connecté à internet"),
                    //   );
                    // }
                    if (controller.isLoading.value == true) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColor.primary,
                        ),
                      );
                    }
                    if (controller.availableBusList.isEmpty) {
                      return const Center(
                        child: Text("Pas de bus disponibles"),
                      );
                    }

                    return Column(
                        children: controller.availableBusList
                            .map(
                              (e) => Column(
                                children: [
                                  ItemBus(
                                      bus: e,
                                      path: const SecondHomeBusScreen()),
                                  SizedBox(
                                    height: CustomSizes.xs,
                                  )
                                ],
                              ),
                            )
                            .toList());
                  }), 
                ],
              ),
            )));
  }
}
