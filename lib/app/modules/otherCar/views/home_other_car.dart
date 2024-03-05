import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/app/modules/bus/views/second_home_bus.dart';
import 'package:mobility/app/modules/otherCar/controllers/other_car_controller.dart';

import '../../../constants/app colors/app_colors.dart';
import '../../../mockData/mock_data.dart';
import '../../../repositories/OtherCarRepository/i_other_car_repository.dart';
import '../../../repositories/OtherCarRepository/other_car_repository_impl.dart';
import '../../widgets/custom_list_title.dart';
import '../../widgets/custom_search_bar.dart';

class HomeOtherCar extends GetView<OtherCarController> {
  const HomeOtherCar({Key? key}) : super(key: key);

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
    TextEditingController textEditting = TextEditingController();
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
            initState: (_) {},
            builder: (_) {
              return Row(
                children: [
                  Expanded(
                    child: CustomSearchBar(
                        hintText: "Recherche",
                        onChanged: (value) {},
                        textEditingController: textEditting),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      Get.defaultDialog(
                          title: "",
                          backgroundColor: AppColor.background,
                          radius: 10,
                          // onWillPop: () async {
                          //   print('object');
                          //   return true;
                          // },
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          content: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Gbaka",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Taxi",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
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
              // return CustomSearchBar(
              //     textEditingController: _.textEditingController,
              //     onChanged: (value) {
              //       if (_.textEditingController.text.isNotEmpty) {
              //         _.number =
              //             RxInt(int.tryParse(_.textEditingController.text)!);
              //         if (_.number != null) {
              //           _.getBusByNumber(_.number!);
              //           _.availableBusList = _.searchBus;
              //         }
              //       } else {
              //         _.getBus();
              //         _.availableBusList = _.busList;
              //       }
              //     });
            },
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Column(
                children: controller.gares
                    .map((e) => Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                title: Text(e.name),
                                trailing: Text(e.commune),
                                subtitle: Text(e.type),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            )
                          ],
                        ))
                    .toList(),
              );
            }),
          )
          // Obx(() {
          //   if (controller.isLoading.value == true) {
          //     return const Center(
          //       child: CircularProgressIndicator(),
          //     );
          //   }
          //   if (controller.availableBusList.isEmpty) {
          //     return const Center(
          //       child: Text("Pas de bus disponibles"),
          //     );
          //   }
          //   return Expanded(
          //     child: GetBuilder<BusController>(
          //       init: BusController(),
          //       initState: (_) {},
          //       builder: (_) {
          //         if (_.availableBusList.isEmpty) {
          //           return Center(
          //             child:
          //                 Text("Aucun Bus de numéro ${_.number}  disponibles"),
          //           );
          //         }
          //         return ListView.builder(
          //           itemCount: 1,
          //           itemBuilder: ((context, snapshot) {
          //             return Column(
          //                 children: _.availableBusList
          //                     .map(
          //                       (e) => Column(
          //                         children: [
          //                           CustomListTitle(
          //                               roadMap: e["roadMap"],
          //                               isActive: e["isActive"],
          //                               description:
          //                                   "${e["source"]}  <->  ${e["destination"]}",
          //                               title: e["number"],
          //                               path: const SecondHomeBus()),
          //                           const SizedBox(
          //                             height: 5,
          //                           )
          //                         ],
          //                       ),
          //                     )
          //                     .toList());
          //           }),
          //         );
          //       },
          //     ),
          //   );
          // }),
        ],
      ),
    );
  }
}
