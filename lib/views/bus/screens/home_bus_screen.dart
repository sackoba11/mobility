import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/constants/app colors/app_colors.dart';
import '../../../common/widgets/custom_list_title.dart';
import '../../../common/widgets/custom_search_bar.dart';
import '../controllers/home_bus_controller.dart';

class HomeBusScreen extends GetView<BusController> {
  const HomeBusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        leading: IconButton(
            iconSize: 26,
            icon: const Icon(Icons.arrow_back_sharp),
            color: AppColor.white,
            onPressed: () => Get.back()),
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
          )
        ],
      ),
      backgroundColor: AppColor.primary,
      body: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Entrer le numero du bus à rechercher.",
                style: TextStyle(fontSize: 30, color: AppColor.white),
              )),
          DraggableScrollableSheet(
            initialChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                color: AppColor.background,
                child: const BodyScreen(),
              );
            },
          )
        ],
      ),
    );
  }
}

class BodyScreen extends GetView<BusController> {
  const BodyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          CustomSearchBar(
              hintText: "Bus Numéro ...",
              textEditingController: controller.textEditingController,
              onChanged: (value) async {
                final text = controller.textEditingController.text.trim();
                if (text.isNotEmpty) {
                  final parsed = int.tryParse(text);
                  if (parsed == null) {
                    controller.searchActiveBus = [];
                    controller.availableActiveBusList = [];
                    controller.update();
                    return;
                  }
                  await controller.getBusByNumber(parsed);
                  controller.availableActiveBusList =
                      controller.searchActiveBus;
                } else {
                  await controller.getAllBus();
                }
              }),
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
              child: ListView.builder(
                itemCount: controller.availableActiveBusList.length,
                itemBuilder: ((context, index) {
                  final e = controller.availableActiveBusList[index];
                  return Column(
                    children: [
                      CustomListTitle(
                          bus: e, routeName: Paths.secondHomeBus),
                      const SizedBox(height: 5),
                    ],
                  );
                }),
              ),
            );
          }),
        ],
      ),
    );
  }
}
