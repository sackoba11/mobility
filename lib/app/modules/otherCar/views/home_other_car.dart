import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/app/modules/otherCar/controllers/other_car_controller.dart';

import '../../../constants/app colors/app_colors.dart';
import '../../widgets/custom_search_bar.dart';
import '../../widgets/item_gare.dart';

class HomeOtherCarView extends GetView<OtherCarController> {
  const HomeOtherCarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OtherCarController());
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        elevation: 0,
      ),
      backgroundColor: AppColor.black,
      body: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Text(
                "Retrouvez la gare la plus proche (Gbaka et Taxi)",
                style: TextStyle(fontSize: 30, color: AppColor.white),
              )),
          DraggableScrollableSheet(
            initialChildSize: 0.7,
            builder: (context, controller) {
              return Container(
                color: AppColor.background,
                child: _buildColumn(context),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildColumn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10),
          Container(
            width: 40,
            height: 5,
            decoration: ShapeDecoration(
              color: const Color(0xFFA7AEB1),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xFFA7AEB1)),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GetBuilder<OtherCarController>(
            init: OtherCarController(),
            builder: (_) {
              return Row(
                children: [
                  Expanded(
                    child: CustomSearchBar(
                        hintText: "Recherche",
                        keyBoardtype: TextInputType.text,
                        textEditingController: _.textEdittingSearch,
                        onChanged: (value) async {
                          if (_.textEdittingSearch.text.isNotEmpty) {
                            _.availableGare.value =
                                await _.getsearchGare(value!);
                          } else {
                            _.availableGare.value =
                                (await _.getGares()).fold((l) => [], (r) => r);
                          }
                        }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      await _.filter();
                    },
                    child: Container(
                        height: 58,
                        width: 58,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColor.primary, width: 0.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.filter_list_outlined,
                          size: 30,
                        )),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value == true) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primary,
                  ),
                );
              }
              if (controller.availableGare.isEmpty &&
                  controller.textEdittingSearch.text.isEmpty) {
                return const Center(
                  child: Text("Pas de Gares disponibles"),
                );
              }
              if (controller.textEdittingSearch.text.isNotEmpty &&
                  controller.availableGare.isEmpty) {
                return Center(
                  child: Text(
                    "Aucune gare trouvée pour ${controller.textEdittingSearch.text}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }

              return ListView(
                children: controller.availableGare
                    .map((element) => Column(
                          children: [
                            if (controller.filterGbaka.value == true &&
                                controller.filterTaxi.value == false &&
                                element.type == "Gbaka")
                              ItemGare(
                                element: element,
                              )
                            else if (controller.filterTaxi.value == true &&
                                controller.filterGbaka.value == false &&
                                element.type == "Taxi")
                              ItemGare(
                                element: element,
                              )
                            else if (controller.filterTaxi.value == true &&
                                    controller.filterGbaka.value == true ||
                                controller.filterTaxi.value == false &&
                                    controller.filterGbaka.value == false)
                              ItemGare(
                                element: element,
                              ),
                          ],
                        ))
                    .toList(),
              );
            }),
          ),
        ],
      ),
    );
  }
}
