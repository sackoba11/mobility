import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../common/map/fm_widgets.dart';
import '../../../common/widgets/map_sheet.dart';
import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../models/transit_stop/transit_stop.dart';
import '../../../routes/app_pages.dart';
import '../../bus/controllers/home_bus_controller.dart';
import '../controllers/stops_controller.dart';

/// Détail d'un arrêt : carte + bus qui y passent.
/// Un bus tapé rejoint le flow existant (SecondHome).
class StopDetailScreen extends GetView<StopsController> {
  StopDetailScreen({super.key});

  /// Controller local (écran sans controller dédié).
  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final stop = controller.selected.value;
    if (stop == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Arrêt')),
        body: const AppEmptyView(
          icon: Icons.directions_bus_outlined,
          title: 'Aucun arrêt sélectionné',
          subtitle: 'Revenez à la liste et choisissez un arrêt.',
        ),
      );
    }
    final stopPos = LatLng(stop.lat, stop.lng);
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: stopPos,
              initialZoom: 15,
              minZoom: 3,
              maxZoom: 18,
            ),
            children: [
              const AppTileLayer(),
              MarkerLayer(
                markers: [
                  Marker(
                    point: stopPos,
                    width: 48,
                    height: 48,
                    child: Icon(Icons.location_on,
                        color: theme.colorScheme.primary,
                        size: 44),
                  ),
                ],
              ),
              const CurrentLocationLayer(
                alignPositionOnUpdate: AlignOnUpdate.never,
              ),
              const MapCredits(),
            ],
          ),
          CenterOnMeButton(
            mapController: mapController,
            heroTag: 'locate_stop_detail',
          ),
          MapSheet(
            initialSize: 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SheetTitle(
                  title: stop.name,
                  subtitle: stop.kindLabel,
                ),
                    const SizedBox(height: 4),
                    Builder(builder: (context) {
                      final dist = controller.distanceTo(stop);
                      if (dist == null) {
                        return const SizedBox.shrink();
                      }
                      return Padding(
                        padding:
                            const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Icon(Icons.near_me_outlined,
                                size: 16,
                                color: theme.colorScheme
                                    .onSurfaceVariant),
                            const SizedBox(width: 6),
                            Text(
                              StopsController.formatDistance(
                                  dist),
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(
                                      color: theme.colorScheme
                                          .onSurfaceVariant),
                            ),
                          ],
                        ),
                      );
                    }),
                    SheetTitle(
                      title:
                          'Bus par ici (${controller.busesThrough(stop).length})',
                      subtitle:
                          'Tapez un bus pour suivre son itinéraire.',
                    ),
                    const SizedBox(height: 8),
                    Builder(builder: (context) {
                      final buses =
                          controller.busesThrough(stop);
                      if (buses.isEmpty) {
                        return const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 16),
                          child: AppEmptyView(
                            icon: Icons.directions_bus_outlined,
                            title: 'Aucun bus connu ici',
                            subtitle:
                                'Les lignes sont en cours de rattachement aux arrêts.',
                          ),
                        );
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(),
                        itemCount: buses.length,
                        separatorBuilder: (_, _) =>
                            const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final bus = buses[index];
                          return BusCard(
                            bus: bus,
                            onTap: () {
                              if (!Get.isRegistered<
                                  BusController>()) {
                                return;
                              }
                              final busController =
                                  Get.find<BusController>();
                              busController.currentBus.value =
                                  bus;
                              Get.toNamed(Paths.secondHomeBus);
                              busController
                                  .getRoutes(bus.roadMap)
                                  .then((r) {
                                busController.routes = r;
                                busController.update();
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
