import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/views/otherCar/controllers/other_car_controller.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/appbar/custom_sliver_appbar.dart';
import '../../../utils/constants/app colors/app_colors.dart';
import '../../../common/widgets/custom_search_bar.dart';
import '../../../common/widgets/item_itinerary.dart';

class HomeOtherCarScreen extends GetView<OtherCarController> {
  const HomeOtherCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OtherCarController());
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          showBackArrow: true,
          actions: [
            IconButton(
              iconSize: 26,
              icon: Icon(
                Icons.restart_alt,
                color: AppColor.white,
              ),
              onPressed: () async {
                await controller.getGares();
              },
            ),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                CustomSliverAppBar(
                  title: "Retrouvez la gare la plus proche (Gbaka et Taxi)",
                  bottomWiget: GetBuilder<OtherCarController>(
                    init: OtherCarController(),
                    builder: (otherController) {
                      return Row(
                        children: [
                          Expanded(
                            child: CustomSearchBar(
                                hintText: "Recherche",
                                withfilter: true,
                                keyBoardtype: TextInputType.text,
                                textEditingController:
                                    otherController.textEdittingSearch,
                                onPressedFilterIcon: () async {
                                  await filter();
                                },
                                onChanged: (value) async {
                                  if (otherController
                                      .textEdittingSearch.text.isNotEmpty) {
                                    otherController.availableItinerary.value =
                                        await otherController
                                            .searchItinerary(value!);
                                  } else {
                                    otherController.availableItinerary.value =
                                        (await otherController.getItinerary())
                                            .fold((l) => [], (r) => r);
                                  }
                                }),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(child: BodyScreen())));
  }

  Future<void> filter() async {
    await Get.defaultDialog(
        title: "",
        backgroundColor: AppColor.background,
        radius: 10,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        content: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Gbaka",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Obx(() => Checkbox(
                    value: controller.filterGbaka.value,
                    activeColor: AppColor.primary,
                    onChanged: (value) {
                      controller.filterGbaka.value =
                          !controller.filterGbaka.value;
                    })),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Taxi",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Obx(() => Checkbox(
                    value: controller.filterTaxi.value,
                    activeColor: AppColor.primary,
                    onChanged: (value) {
                      controller.filterTaxi.value =
                          !controller.filterTaxi.value;
                    })),
              ],
            )
          ],
        ));
  }
}

class BodyScreen extends StatelessWidget {
  const BodyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OtherCarController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 15),
          Obx(() {
            if (controller.isLoading.value == true) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.primary,
                ),
              );
            }
            if (controller.availableItinerary.isEmpty &&
                controller.textEdittingSearch.text.isEmpty) {
              return const Center(
                child: Text("Pas de Gares disponibles"),
              );
            }
            if (controller.textEdittingSearch.text.isNotEmpty &&
                controller.availableItinerary.isEmpty) {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Aucune gare trouvée pour ",
                    ),
                    Text(
                      controller.textEdittingSearch.text,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            }

            return Column(
              children: controller.availableItinerary
                  .map((element) => Column(
                        children: [
                          if (controller.filterGbaka.value == true &&
                              controller.filterTaxi.value == false &&
                              element.type == "Gbaka")
                            ItemItinerary(
                              element: element,
                            )
                          else if (controller.filterTaxi.value == true &&
                              controller.filterGbaka.value == false &&
                              element.type == "Taxi")
                            ItemItinerary(
                              element: element,
                            )
                          else if (controller.filterTaxi.value == true &&
                                  controller.filterGbaka.value == true ||
                              controller.filterTaxi.value == false &&
                                  controller.filterGbaka.value == false)
                            ItemItinerary(
                              element: element,
                            ),
                        ],
                      ))
                  .toList(),
            );
          }),
        ],
      ),
    );
  }
}
