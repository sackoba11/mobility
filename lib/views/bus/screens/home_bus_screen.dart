import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/app_search_field.dart';
import '../../../common/widgets/map_sheet.dart';
import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_bus_controller.dart';

/// Recherche d'un bus par numéro (Phase 4).
class HomeBusScreen extends GetView<BusController> {
  const HomeBusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text("Bus Sotra"),
        actions: [
          IconButton(
            tooltip: "Actualiser",
            icon: const Icon(Icons.refresh),
            onPressed: () async => controller.getAllBus(),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text(
              "Entrez le numéro du bus à rechercher.",
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          MapSheet(
            initialSize: 0.72,
            minSize: 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSearchField(
                  controller: controller.textEditingController,
                  hintText: "Numéro du bus (ex. 610)",
                  keyboardType: TextInputType.number,
                  onChanged: (value) async {
                    final text = value.trim();
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
                  },
                ),
                const SizedBox(height: 16),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const AppLoadingView(
                        message: "Recherche des bus...");
                  }
                  if (controller.errorMessage.value.isNotEmpty &&
                      controller.availableActiveBusList.isEmpty) {
                    return AppErrorView(
                      message: controller.errorMessage.value,
                      onRetry: () => controller.getAllBus(),
                    );
                  }
                  if (controller.availableActiveBusList.isEmpty) {
                    return const AppEmptyView(
                      icon: Icons.directions_bus_outlined,
                      title: "Aucun bus disponible",
                      subtitle:
                          "Essayez un autre numéro ou actualisez la liste.",
                    );
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        controller.availableActiveBusList.length,
                    separatorBuilder: (_, _) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final bus =
                          controller.availableActiveBusList[index];
                      return BusCard(
                        bus: bus,
                        onTap: () {
                          controller.currentBus.value = bus;
                          Get.toNamed(Paths.secondHomeBus);
                          controller
                              .getRoutes(bus.roadMap)
                              .then((r) {
                            controller.routes = r;
                            controller.update();
                          });
                        },
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
