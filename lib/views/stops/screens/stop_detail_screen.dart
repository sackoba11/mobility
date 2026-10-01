import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../common/map/fm_widgets.dart';
import '../../../common/widgets/map_sheet.dart';
import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../models/bus/bus_from_realTime/bus_from_db.dart';
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
    // Zoom serré sur l'arrêt (bien visible d'emblée). Le bouton
    // "voir les deux" élargit à ma position si besoin.
    final fitKey = '${stop.lat},${stop.lng}';
    if (controller.lastFittedStopKey != fitKey) {
      controller.lastFittedStopKey = fitKey;
      fitWhenReady(mapController, [stopPos], closeZoom: 16);
    }
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: stopPos,
              initialZoom: 18,
              minZoom: 3,
              maxZoom: 19,
            ),
            children: [
              const AppTileLayer(),
              MarkerLayer(
                markers: [
                  Marker(
                    point: stopPos,
                    width: 48,
                    height: 48,
                    child: ZoomScaled.square(
                      baseSize: 44,
                      child: Icon(
                        Icons.location_on_rounded,
                        color: theme.colorScheme.primary,
                        size: 44,
                      ),
                    ),
                  ),
                ],
              ),
              // never : le recentrage auto sur l'utilisateur masquerait
              // l'arrêt recherché quand il est loin.
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
          FitPointsButton(
            mapController: mapController,
            heroTag: 'fit_stop_detail',
            pointsOf: () {
              LatLng? u;
              if (Get.isRegistered<BusController>()) {
                final busCtrl = Get.find<BusController>();
                final lat = double.tryParse(busCtrl.userLatitude.value);
                final lng = double.tryParse(busCtrl.userLongitude.value);
                if (lat != null && lng != null) u = LatLng(lat, lng);
              }
              return u != null ? [stopPos, u] : [stopPos];
            },
          ),
          MapSheet(
            initialSize: 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: SheetTitle(title: stop.name, compact: true),
                    ),
                    Expanded(
                      flex: 2,
                      child: Builder(
                        builder: (context) {
                          final dist = controller.distanceTo(stop);
                          if (dist == null) {
                            return const SizedBox.shrink();
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.near_me_rounded,
                                size: 16,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 6),

                              Text(
                                StopsController.formatDistance(dist),
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                SheetTitle(
                  title:
                      'Bus en approche (${controller.approachingBuses(stop).length})',
                  subtitle: 'Bus en service en direction de cet arrêt.',
                  compact: true,
                ),
                const SizedBox(height: 8),
                Builder(
                  builder: (context) {
                    final buses = controller.approachingBuses(stop);
                    if (buses.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Aucun bus en approche pour le moment.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      );
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: buses.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final bus = buses[index];
                        return BusCard(
                          bus: bus,
                          compact: true,
                          onTap: () => _followBus(context, bus),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                Builder(
                  builder: (context) {
                    final lines = controller.servingLines(stop);
                    return SheetTitle(
                      title: 'Lignes de desserte (${lines.length})',
                      compact: true,
                      // subtitle: 'Toutes les lignes passant par ici.',
                    );
                  },
                ),
                // const SizedBox(height: 8),
                Builder(
                  builder: (context) {
                    final lines = controller.servingLines(stop);
                    if (lines.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: AppEmptyView(
                          icon: Icons.directions_bus_outlined,
                          title: 'Aucune ligne connue ici',
                          subtitle:
                              'Les lignes sont en cours de rattachement aux arrêts.',
                        ),
                      );
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: lines.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final bus = lines[index];
                        return BusCard(
                          bus: bus,
                          compact: true,
                          onTap: () {
                            if (!Get.isRegistered<BusController>()) {
                              return;
                            }
                            final busController = Get.find<BusController>();
                            busController.currentBus.value = bus;
                            Get.toNamed(Paths.lineDetail);
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Suit un bus en service sur la carte live.
  void _followBus(BuildContext context, BusFromDb bus) {
    if (!Get.isRegistered<BusController>()) return;
    final busController = Get.find<BusController>();
    busController.currentBus.value = bus;
    busController.resetSecondFit();
    busController.resetDetailFit();
    Get.toNamed(Paths.secondHomeBus);
    busController.getRoutes(bus.roadMap).then((r) {
      busController.routes = r;
      busController.update();
    });
  }
}
