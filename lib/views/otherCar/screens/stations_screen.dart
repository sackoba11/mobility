import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/app_search_field.dart';
import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../models/gare/gare.dart';
import '../../../routes/app_pages.dart';
import '../controllers/other_car_controller.dart';

/// Page dédiée : toutes les gares Gbaka & Taxi (recherche par nom).
class StationsScreen extends StatefulWidget {
  const StationsScreen({super.key});

  @override
  State<StationsScreen> createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen> {
  final TextEditingController search = TextEditingController();
  String query = '';

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OtherCarController>();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Gares Gbaka & Taxi')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: AppSearchField(
              controller: search,
              hintText: 'Rechercher une gare...',
              onChanged: (v) =>
                  setState(() => query = v.trim().toLowerCase()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Obx(() {
              final n = _filtered(controller).length;
              return Text(
                'Gares ($n)',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              );
            }),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value &&
                  controller.gares.isEmpty) {
                return const AppLoadingView(
                    message: 'Chargement des gares...');
              }
              final gares = _filtered(controller);
              if (gares.isEmpty) {
                return AppEmptyView(
                  icon: Icons.location_off_outlined,
                  title: 'Aucune gare trouvée',
                  subtitle: query.isEmpty
                      ? 'Revenez plus tard.'
                      : 'Pour "$query".',
                );
              }
              return RefreshIndicator(
                onRefresh: () async {
                  controller.availableGare.value =
                      (await controller.getGares())
                          .fold((l) => [], (r) => r);
                },
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                  itemCount: gares.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final gare = gares[index];
                    return GareCard(
                      gare: gare,
                      onTap: () => _openGare(controller, gare),
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

  List<Gare> _filtered(OtherCarController controller) {
    final all = controller.gares.toList()
      ..sort((a, b) => a.name.compareTo(b.name));
    if (query.isEmpty) return all;
    return all
        .where((g) =>
            g.name.toLowerCase().contains(query) ||
            g.commune.toLowerCase().contains(query))
        .toList();
  }

  Future<void> _openGare(
      OtherCarController controller, Gare gare) async {
    controller.gare.value = gare;
    controller.resetFits();
    Get.toNamed(Paths.detailOtherCar);
    controller.routes.value =
        await controller.getRoutes(gare.location);
    controller.update();
  }
}
