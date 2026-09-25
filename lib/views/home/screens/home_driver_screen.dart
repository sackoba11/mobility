import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/widgets/app_search_field.dart';
import '../../../common/widgets/map_sheet.dart';
import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../common/widgets/user_avatar.dart';
import '../../../models/bus/bus_from_firestore/bus.dart';
import '../../../routes/app_pages.dart';
import '../../../services/driver_tracking/driver_session_store.dart';
import '../../driver/controllers/service_tab_controller.dart';
import '../controllers/home_driver_controller.dart';

/// Onglet Bus chauffeur (Phase shell) : choisir le bus à mettre en service.
/// Le logout vit dans l'onglet Profil, le retour système est géré par le shell.
class HomeDriverScreen extends GetView<HomeDriverController> {
  const HomeDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<HomeDriverController>()) {
      Get.put(HomeDriverController());
    }
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: _DriverAvatar(),
          ),
          title: const Text("Espace chauffeur"),
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(
                "Quel bus mettez-vous en service ?",
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
                  AppSearchField(
                    controller: controller.textEditingController,
                    hintText: "Numéro du bus (ex. 610)",
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final text = value.trim();
                      if (text.isNotEmpty) {
                        final parsed = int.tryParse(text);
                        if (parsed == null) {
                          controller.searchBus = [];
                          controller.availableBusList = [];
                          controller.update();
                          return;
                        }
                        controller.number = RxInt(parsed);
                        controller.getBusByNumber(parsed);
                        controller.availableBusList =
                            controller.searchBus;
                      } else {
                        controller.getBus();
                        controller.availableBusList =
                            controller.busList;
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const AppLoadingView(
                          message: "Chargement des bus...");
                    }
                    if (controller.availableBusList.isEmpty) {
                      final query = controller
                          .textEditingController.text
                          .trim();
                      return AppEmptyView(
                        icon: Icons.directions_bus_outlined,
                        title: query.isEmpty
                            ? "Pas de bus disponibles"
                            : "Aucun bus n°$query",
                        subtitle: query.isEmpty
                            ? "Revenez plus tard."
                            : "Vérifiez le numéro saisi.",
                      );
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          controller.availableBusList.length,
                      separatorBuilder: (_, _) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final Bus e =
                            controller.availableBusList[index];
                        return _DriverBusCard(
                          bus: e,
                          onTap: () =>
                              Get.toNamed(Paths.driver, arguments: e),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: scheme.surface,
      );
  }
}

class _DriverAvatar extends GetView<HomeDriverController> {
  @override
  Widget build(BuildContext context) {
    final photoUrl = controller.currentUser?.photoURL;
    if (photoUrl != null && photoUrl.isNotEmpty) {
      return UserAvatar(user: controller.currentUser, radius: 20);
    }
    String initial = "?";
    final email = controller.currentUser?.email?.trim();
    if (email != null && email.isNotEmpty) {
      initial = email[0].toUpperCase();
    }
    return CircleAvatar(
      radius: 20,
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Text(initial,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700)),
    );
  }
}

/// Carte bus version chauffeur (modèle Bus Firestore, pas BusFromDb).
class _DriverBusCard extends StatelessWidget {
  final Bus bus;
  final VoidCallback onTap;

  const _DriverBusCard({required this.bus, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(14),
                ),
                alignment: Alignment.center,
                child: Text(
                  bus.number.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(bus.source,
                        style: theme.textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    Text("↔ ${bus.destination}",
                        style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme
                                .colorScheme.onSurfaceVariant),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Obx(() {
                // Source réactive unique si dispo, sinon lecture du store.
                int sessionBus;
                if (Get.isRegistered<ServiceTabController>()) {
                  sessionBus = Get.find<ServiceTabController>()
                      .busNumber
                      .value;
                } else {
                  final stored =
                      DriverSessionStore.read()?['busNumber'];
                  sessionBus = stored is int ? stored : -1;
                }
                final bool mine = sessionBus == bus.number;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (mine)
                      StatusBadge.active(context,
                          label: "En service")
                    else if (bus.isActive)
                      StatusBadge.active(context, label: "Actif"),
                    const SizedBox(height: 8),
                    Icon(Icons.chevron_right,
                        color: theme.colorScheme.onSurfaceVariant),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
