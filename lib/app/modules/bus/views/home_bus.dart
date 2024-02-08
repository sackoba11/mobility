import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/app/modules/bus/views/second_home_bus.dart';

import '../../../constants/app colors/app_colors.dart';
import '../../widgets/custom_list_title.dart';
import '../../widgets/custom_search_bar.dart';
import '../controllers/home_bus_controller.dart';

class HomeBus extends GetView<BusController> {
  const HomeBus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BusController());
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
                "Entrer le numero de votre bus pour le tracker.",
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
          GetBuilder<BusController>(
            init: BusController(),
            initState: (_) {},
            builder: (_) {
              return CustomSearchBar(
                  textEditingController: _.textEditingController,
                  onChanged: (value) {
                    if (_.textEditingController.text.isNotEmpty) {
                      _.number =
                          RxInt(int.tryParse(_.textEditingController.text)!);
                      if (_.number != null) {
                        _.getBusByNumber(_.number!);
                        _.availableBusList = _.searchBus;
                      }
                    } else {
                      _.getBus();
                      _.availableBusList = _.busList;
                    }
                  });
            },
          ),
          const SizedBox(height: 15),
          Obx(() {
            if (controller.isLoading.value == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (controller.availableBusList.isEmpty) {
              return const Center(
                child: Text("Pas de bus disponibles"),
              );
            }
            return Expanded(
              child: GetBuilder<BusController>(
                init: BusController(),
                initState: (_) {},
                builder: (_) {
                  if (_.availableBusList.isEmpty) {
                    return Center(
                      child:
                          Text("Aucun Bus de numéro ${_.number}  disponibles"),
                    );
                  }
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: ((context, snapshot) {
                      return Column(
                          children: _.availableBusList
                              .map(
                                (e) => Column(
                                  children: [
                                    CustomListTitle(
                                        roadMap: e["roadMap"],
                                        isActive: e["isActive"],
                                        description:
                                            "${e["source"]}  <->  ${e["destination"]}",
                                        title: e["number"],
                                        path: const SecondHomeBus()),
                                    const SizedBox(
                                      height: 5,
                                    )
                                  ],
                                ),
                              )
                              .toList());
                    }),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
