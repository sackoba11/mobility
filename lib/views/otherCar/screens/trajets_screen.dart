import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/models/transport_type.dart';

import '../../../common/widgets/app_search_field.dart';
import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../models/itineraire_gare/itineraire_gare.dart';
import '../../../routes/app_pages.dart';
import '../controllers/other_car_controller.dart';

/// Page dédiée : tous les trajets Gbaka & Taxi (recherche + filtre type).
class TrajetsScreen extends StatefulWidget {
  const TrajetsScreen({super.key});

  @override
  State<TrajetsScreen> createState() => _TrajetsScreenState();
}

class _TrajetsScreenState extends State<TrajetsScreen> {
  final TextEditingController search = TextEditingController();
  String query = '';
  String typeFilter = 'all'; // all | gbaka | taxi

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
      appBar: AppBar(title: const Text('Trajets Gbaka & Taxi')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: AppSearchField(
              controller: search,
              hintText: 'Rechercher un trajet...',
              onChanged: (v) =>
                  setState(() => query = v.trim().toLowerCase()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                  label: const Text('Tous'),
                  selected: typeFilter == 'all',
                  onSelected: (_) =>
                      setState(() => typeFilter = 'all'),
                ),
                ChoiceChip(
                  label: const Text('Gbaka'),
                  selected: typeFilter == 'gbaka',
                  onSelected: (_) =>
                      setState(() => typeFilter = 'gbaka'),
                ),
                ChoiceChip(
                  label: const Text('Taxi'),
                  selected: typeFilter == 'taxi',
                  onSelected: (_) =>
                      setState(() => typeFilter = 'taxi'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
            child: Obx(() {
              final n = _filtered(controller).length;
              return Text(
                'Trajets ($n)',
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
                  controller.itineraries.isEmpty) {
                return const AppLoadingView(
                    message: 'Chargement des trajets...');
              }
              if (controller.errorMessage.value.isNotEmpty &&
                  controller.itineraries.isEmpty) {
                return AppErrorView(
                  message: controller.errorMessage.value,
                  onRetry: () => controller.getItinerary(),
                );
              }
              final trajets = _filtered(controller);
              if (trajets.isEmpty) {
                return const AppEmptyView(
                  icon: Icons.location_off_outlined,
                  title: 'Aucun trajet trouvé',
                  subtitle: 'Modifiez la recherche ou le filtre.',
                );
              }
              return RefreshIndicator(
                onRefresh: () async {
                  controller.availableItinerary.value =
                      (await controller.getItinerary())
                          .fold((l) => [], (r) => r);
                },
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                  itemCount: trajets.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final element = trajets[index];
                    return ItineraryCard(
                      itinerary: element,
                      onTap: () {
                        controller.itinerary.value = element;
                        controller.resetFits();
                        Get.toNamed(Paths.secondOtherCar);
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

  List<ItineraireGare> _filtered(OtherCarController controller) {
    var list = controller.itineraries.toList();
    if (typeFilter == 'gbaka') {
      list = list
          .where((e) => e.type == TransportType.gbaka)
          .toList();
    } else if (typeFilter == 'taxi') {
      list = list
          .where((e) => e.type == TransportType.taxi)
          .toList();
    }
    if (query.isEmpty) return list;
    return list
        .where((e) =>
            e.source.name.toLowerCase().contains(query) ||
            e.destination.name.toLowerCase().contains(query) ||
            e.commune.toLowerCase().contains(query))
        .toList();
  }
}
