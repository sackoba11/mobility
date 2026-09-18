import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/models/transport_type.dart';
import 'package:mobility/views/otherCar/controllers/other_car_controller.dart';

import '../../../common/widgets/app_search_field.dart';
import '../../../common/widgets/map_sheet.dart';
import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../routes/app_pages.dart';

/// Recherche de gares Gbaka / Taxi (Phase 4).
class HomeOtherCarScreen extends GetView<OtherCarController> {
  const HomeOtherCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(title: const Text("Gares Gbaka & Taxi")),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text(
              "Retrouvez la gare la plus proche.",
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          MapSheet(
            initialSize: 0.68,
            minSize: 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppSearchField(
                        controller: controller.textEdittingSearch,
                        hintText: "Rechercher une gare...",
                        onChanged: (value) async {
                          final text = value.trim();
                          if (text.isNotEmpty) {
                            controller.availableItinerary.value =
                                await controller.searchItinerary(text);
                          } else {
                            controller.availableItinerary.value =
                                (await controller.getItinerary())
                                    .fold((l) => [], (r) => r);
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                        color: scheme.primaryContainer,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: IconButton(
                        tooltip: "Filtrer",
                        onPressed: () => _showFilter(context),
                        icon: Icon(Icons.filter_list,
                            color: scheme.onPrimaryContainer),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Obx(() {
                  final filters = <String>[];
                  if (controller.filterGbaka.value) filters.add("Gbaka");
                  if (controller.filterTaxi.value) filters.add("Taxi");
                  if (filters.isEmpty) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Wrap(
                      spacing: 8,
                      children: filters
                          .map((f) => Chip(
                                label: Text(f),
                                onDeleted: () {
                                  if (f == "Gbaka") {
                                    controller.filterGbaka.value = false;
                                  } else {
                                    controller.filterTaxi.value = false;
                                  }
                                },
                              ))
                          .toList(),
                    ),
                  );
                }),
                const SizedBox(height: 12),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const AppLoadingView(
                        message: "Chargement des gares...");
                  }
                  if (controller.errorMessage.value.isNotEmpty &&
                      controller.availableItinerary.isEmpty) {
                    return AppErrorView(
                      message: controller.errorMessage.value,
                      onRetry: () => controller.getItinerary(),
                    );
                  }
                  if (controller.availableItinerary.isEmpty) {
                    final query =
                        controller.textEdittingSearch.text.trim();
                    return AppEmptyView(
                      icon: Icons.location_off_outlined,
                      title: query.isEmpty
                          ? "Pas de gares disponibles"
                          : "Aucune gare trouvée",
                      subtitle: query.isEmpty
                          ? "Revenez plus tard."
                          : 'Pour "$query".',
                    );
                  }
                  final showGbaka = controller.filterGbaka.value;
                  final showTaxi = controller.filterTaxi.value;
                  final filtered = controller.availableItinerary.where((e) {
                    if (showGbaka && !showTaxi) {
                      return e.type == TransportType.gbaka;
                    }
                    if (showTaxi && !showGbaka) {
                      return e.type == TransportType.taxi;
                    }
                    return true;
                  }).toList();
                  if (filtered.isEmpty) {
                    return const AppEmptyView(
                      icon: Icons.filter_list_off_outlined,
                      title: "Aucun résultat pour ce filtre",
                      subtitle: "Modifiez les filtres pour voir plus de gares.",
                    );
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filtered.length,
                    separatorBuilder: (_, _) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final element = filtered[index];
                      return ItineraryCard(
                        itinerary: element,
                        onTap: () {
                          controller.itinerary.value = element;
                          Get.toNamed(Paths.secondOtherCar);
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

  Future<void> _showFilter(BuildContext context) {
    final theme = Theme.of(context);
    return Get.defaultDialog(
      title: "Filtrer par type",
      titleStyle: theme.textTheme.titleLarge,
      backgroundColor: theme.colorScheme.surface,
      radius: 20,
      content: Obx(() => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CheckboxListTile(
                title: const Text("Gbaka"),
                value: controller.filterGbaka.value,
                onChanged: (_) => controller.filterGbaka.value =
                    !controller.filterGbaka.value,
              ),
              CheckboxListTile(
                title: const Text("Taxi"),
                value: controller.filterTaxi.value,
                onChanged: (_) => controller.filterTaxi.value =
                    !controller.filterTaxi.value,
              ),
            ],
          )),
      textConfirm: "Appliquer",
      confirmTextColor: Colors.white,
      buttonColor: theme.colorScheme.primary,
      onConfirm: () => Get.back(),
    );
  }
}
