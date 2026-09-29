import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_bus_controller.dart';

/// Page dédiée : bus en service, les plus proches d'abord.
class ActiveBusesScreen extends GetView<BusController> {
  const ActiveBusesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Bus en service')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const AppLoadingView(
              message: 'Recherche des bus en service...');
        }
        if (controller.errorMessage.value.isNotEmpty &&
            controller.activeBusList.isEmpty) {
          return AppErrorView(
            message: controller.errorMessage.value,
            onRetry: () => controller.getAllBus(),
          );
        }
        final buses = controller.activeSorted;
        if (buses.isEmpty) {
          return const AppEmptyView(
            icon: Icons.directions_bus_outlined,
            title: 'Aucun bus en service',
            subtitle:
                'Revenez plus tard ou explorez les lignes.',
          );
        }
        return RefreshIndicator(
          onRefresh: controller.getAllBus,
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            itemCount: buses.length,
            separatorBuilder: (_, _) =>
                const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final bus = buses[index];
              final dist = controller.liveDistance(bus) ??
                  controller.minStopDistance(bus);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (dist != null)
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 4, bottom: 4),
                      child: Text(
                        _formatDistance(dist),
                        style: theme.textTheme.bodySmall?.copyWith(
                            color: theme
                                .colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  BusCard(
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
                  ),
                ],
              );
            },
          ),
        );
      }),
    );
  }
}

String _formatDistance(double meters) {
  if (meters < 1000) return 'à ${meters.round()} m';
  return 'à ${(meters / 1000).toStringAsFixed(1)} km';
}
