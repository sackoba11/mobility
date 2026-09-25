import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobility/services/places/poi_controller.dart';
import 'package:mobility/services/places/poi_service.dart';

/// Marqueurs des lieux (épingle catégorie + dialogue au tap).
List<Marker> poiMarkers(List<PoiPlace> places, BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return [
    for (final p in places)
      Marker(
        point: LatLng(p.lat, p.lng),
        width: 44,
        height: 44,
        child: GestureDetector(
          onTap: () => Get.defaultDialog(
            title: p.name,
                middleText:
                    '${p.category.label} ${p.details.isEmpty ? '' : '\n$p.details'}',
            textConfirm: 'OK',
            confirmTextColor: Colors.white,
            buttonColor: scheme.primary,
            onConfirm: () => Get.back(),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: scheme.secondaryContainer,
              shape: BoxShape.circle,
              border: Border.all(color: scheme.primary, width: 2),
            ),
            child: Icon(p.category.icon,
                size: 22, color: scheme.onSecondaryContainer),
          ),
        ),
      ),
  ];
}

/// Bouton flottant + panneau de sélection des catégories POI,
/// à poser dans le Stack d'une carte (haut-droite).
/// [centerOf] fournit le centre courant de la carte pour la recherche.
class PoiMapOverlay extends GetView<PoiController> {
  final LatLng Function() centerOf;

  const PoiMapOverlay({super.key, required this.centerOf});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<PoiController>()) {
      Get.put(PoiController(), permanent: true);
    }
    final scheme = Theme.of(context).colorScheme;
    return Positioned(
      top: 12,
      right: 12,
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton.small(
                heroTag: 'poi_toggle_$hashCode',
                tooltip: 'Points d\u2019intérêt',
                backgroundColor: controller.hasSelection
                    ? scheme.primary
                    : scheme.surface,
                foregroundColor: controller.hasSelection
                    ? scheme.onPrimary
                    : scheme.onSurfaceVariant,
                onPressed: controller.togglePanel,
                child: controller.isLoading.value
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: controller.hasSelection
                              ? scheme.onPrimary
                              : scheme.primary,
                        ),
                      )
                    : const Icon(Icons.place_outlined),
              ),
              if (controller.panelOpen.value) ...[
                const SizedBox(height: 8),
                Container(
                  width: 220,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: scheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: scheme.outline),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('À proximité',
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          for (final c in PoiCategory.values)
                            FilterChip(
                              label: Text(c.label,
                                  style: const TextStyle(fontSize: 12)),
                              avatar: Icon(c.icon, size: 16),
                              selected:
                                  controller.selected.contains(c),
                              onSelected: (_) => controller
                                  .toggleCategory(c, centerOf()),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ],
          )),
    );
  }
}
