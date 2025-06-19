import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/app colors/app_colors.dart';
import '../../../common/widgets/custom_list_title.dart';
import '../../../common/widgets/custom_search_bar.dart';
import '../controllers/home_bus_controller.dart';
import 'second_home_bus_screen.dart';

class HomeBusScreen extends GetView<BusController> {
  const HomeBusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BusController());
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        elevation: 0,
        actions: [
          IconButton(
            iconSize: 26,
            icon: const Icon(Icons.restart_alt),
            onPressed: () async {
              await controller.getAllBus();
            },
          )
        ],
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
        children: [
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
                  hintText: "Bus Numéro ...",
                  textEditingController: _.textEditingController,
                  onChanged: (value) async {
                    if (_.textEditingController.text.isNotEmpty) {
                      await _.getBusByNumber(
                          int.tryParse(_.textEditingController.text)!);
                      _.availableActiveBusList = _.searchActiveBus;
                    } else {
                      await _.getAllBus();
                      // _.availableActiveBusList = _.activeBusList;
                    }
                  });
            },
          ),
          const SizedBox(height: 15),
          Obx(() {
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
            return Expanded(
              child: GetBuilder<BusController>(
                init: BusController(),
                initState: (_) {},
                builder: (_) {
                  if (_.availableActiveBusList.isEmpty) {
                    return const Center(
                      child: Text("Aucun Bus trouvé"),
                    );
                  }
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: ((context, snapshot) {
                      return Column(
                          children: _.availableActiveBusList
                              .map(
                                (e) => Column(
                                  children: [
                                    CustomListTitle(
                                        bus: e,
                                        path: const SecondHomeBusScreen()),
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
