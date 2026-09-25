import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobility/services/places/poi_service.dart';

/// État POI partagé (permanent) : catégories cochées + lieux + chargement.
/// Un seul par app : la sélection suit l'utilisateur d'une carte à l'autre.
class PoiController extends GetxController {
  final RxSet<PoiCategory> selected = <PoiCategory>{}.obs;
  final RxList<PoiPlace> places = <PoiPlace>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool panelOpen = false.obs;

  bool get hasSelection => selected.isNotEmpty;

  void togglePanel() => panelOpen.value = !panelOpen.value;

  void toggleCategory(PoiCategory category, LatLng center) {
    if (selected.contains(category)) {
      selected.remove(category);
      places.removeWhere((p) => p.category == category);
    } else {
      selected.add(category);
      fetch(center);
    }
  }

  Future<void> fetch(LatLng center) async {
    if (selected.isEmpty) {
      places.clear();
      return;
    }
    isLoading.value = true;
    try {
      final result = await PoiService.fetchNearby(
        lat: center.latitude,
        lng: center.longitude,
        categories: selected,
      );
      places.assignAll(result);
    } finally {
      isLoading.value = false;
    }
  }

  void clear() {
    selected.clear();
    places.clear();
    panelOpen.value = false;
  }
}
