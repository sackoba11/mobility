import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/app_search_field.dart';
import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_bus_controller.dart';

/// Page dédiée : toutes les variantes aller (recherche par numéro).
class LinesScreen extends StatefulWidget {
  const LinesScreen({super.key});

  @override
  State<LinesScreen> createState() => _LinesScreenState();
}

class _LinesScreenState extends State<LinesScreen> {
  final TextEditingController search = TextEditingController();
  String query = '';

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BusController>();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Lignes de bus')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: AppSearchField(
              controller: search,
              hintText: 'Numéro du bus (ex. 610)',
              keyboardType: TextInputType.number,
              onChanged: (v) =>
                  setState(() => query = v.trim()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Obx(() {
              final n = _filtered(controller).length;
              return Text(
                'Lignes de bus ($n)',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              );
            }),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const AppLoadingView(
                    message: 'Chargement des lignes...');
              }
              final buses = _filtered(controller);
              if (buses.isEmpty) {
                return AppEmptyView(
                  icon: Icons.search_off_outlined,
                  title: 'Aucune ligne trouvée',
                  subtitle: query.isEmpty
                      ? 'Revenez plus tard.'
                      : 'Pour "$query".',
                );
              }
              return RefreshIndicator(
                onRefresh: controller.getAllBus,
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                  itemCount: buses.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final bus = buses[index];
                    return BusCard(
                      bus: bus,
                      onTap: () {
                        controller.currentBus.value = bus;
                        Get.toNamed(Paths.lineDetail);
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

  List _filtered(BusController controller) {
    final all = controller.allerLines;
    if (query.isEmpty) return all;
    return all
        .where((b) =>
            b.number.toString().contains(query) ||
            b.lineLabel.contains(query))
        .toList();
  }
}
