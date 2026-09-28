import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/app_search_field.dart';
import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_bus_controller.dart';

/// Recherche d'un bus par numéro : layout fixe moderne
/// (recherche épinglée + liste, sans bottom-sheet).
class HomeBusScreen extends GetView<BusController> {
  const HomeBusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: Text(
              "Entrez le numéro du bus à rechercher.",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: AppSearchField(
              controller: controller.textEditingController,
              hintText: "Numéro du bus (ex. 610)",
              keyboardType: TextInputType.number,
              onChanged: (value) async {
                final text = value.trim();
                if (text.isNotEmpty) {
                  final parsed = int.tryParse(text);
                  if (parsed == null) {
                    controller.searchActiveBus.clear();
                    controller.availableActiveBusList.clear();
                    return;
                  }
                  await controller.getBusByNumber(parsed);
                } else {
                  await controller.getAllBus();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => Get.toNamed(Paths.stops),
                icon: const Icon(Icons.location_on_outlined),
                label: const Text('Arrêts et gares à proximité'),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Obx(() {
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
              return RefreshIndicator(
                onRefresh: controller.getAllBus,
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
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
                        controller.resetSecondFit();
                        controller.resetDetailFit();
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
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
