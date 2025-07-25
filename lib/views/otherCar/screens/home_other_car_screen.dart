import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/views/otherCar/controllers/other_car_controller.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/appbar/custom_sliver_appbar.dart';
import '../../../utils/constants/app colors/app_colors.dart';
import '../../../common/widgets/custom_search_bar.dart';
import '../../../common/widgets/item_itinerary.dart';
import '../../../utils/constants/app string/app_string.dart';
import '../../../common/widgets/wrappers/body_screen_wrapper.dart';
import 'widgets/filter_widget.dart';

class HomeOtherCarScreen extends GetView<OtherCarController> {
  const HomeOtherCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OtherCarController());
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColor.background,
        appBar: CustomAppBar(
          backgroundColor: AppColor.transparent,
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
                CustomSliverAppBarWithPrimaryheader(
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
            body: SingleChildScrollView(
                child: BodyScreenWrapper(
              children: [
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
                    return Center(
                      child: Text(AppString.noStationsAvailable),
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
            ))));
  }

  Future<void> filter() async {
    await Get.defaultDialog(
        title: "Types de Gares",
        titleStyle: TextStyle(fontSize: 17),
        backgroundColor: AppColor.background,
        radius: 10,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        content: FilterWidget(controller: controller));
  }
}
