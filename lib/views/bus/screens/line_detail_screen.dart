import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../common/map/fm_widgets.dart';
import '../../../common/widgets/app_button.dart';
import '../../../common/widgets/map_sheet.dart';
import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../models/bus/bus_from_realTime/bus_from_db.dart';
import '../../../models/stop/stop.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_bus_controller.dart';

/// Seuil "arrêt proche" (mètres) : badge vert sur la timeline.
const double kNearbyThresholdMeters = 500;

/// Détail d'une ligne : sélecteur Aller / Retour, timeline des arrêts
/// de l'itinéraire + badge "proche" + itinéraire sur carte.
class LineDetailScreen extends StatefulWidget {
  const LineDetailScreen({super.key});

  @override
  State<LineDetailScreen> createState() => _LineDetailScreenState();
}

class _LineDetailScreenState extends State<LineDetailScreen> {
  late final BusController controller = Get.find<BusController>();
  late final List<BusFromDb> allers;
  late final List<BusFromDb> retours;
  int tab = 0;
  int allerIdx = 0;
  int retourIdx = 0;

  @override
  void initState() {
    super.initState();
    final line = controller.currentBus.value;
    final variants = controller.variantsOf(line.number);
    allers = variants.where((b) => !BusController.isRetour(b)).toList();
    retours = variants.where(BusController.isRetour).toList();
    allerIdx = _indexOf(allers, line);
    retourIdx = _indexOf(retours, line);
    tab = (BusController.isRetour(line) && retours.isNotEmpty) ? 1 : 0;
  }

  static int _indexOf(List<BusFromDb> list, BusFromDb line) {
    final idx = list.indexWhere((v) =>
        v.direction == line.direction &&
        v.variantIndex == line.variantIndex);
    return idx >= 0 ? idx : 0;
  }

  BusFromDb? get _currentVariant {
    if (tab == 0) {
      return allers.isEmpty
          ? null
          : allers[allerIdx.clamp(0, allers.length - 1)];
    }
    return retours.isEmpty
        ? null
        : retours[retourIdx.clamp(0, retours.length - 1)];
  }

  @override
  Widget build(BuildContext context) {
    final line = controller.currentBus.value;
    if (line.number == 0) {
      return Scaffold(
        appBar: AppBar(title: const Text('Ligne')),
        body: const AppEmptyView(
          icon: Icons.directions_bus_outlined,
          title: 'Aucune ligne sélectionnée',
          subtitle: 'Revenez à la liste et choisissez une ligne.',
        ),
      );
    }
    return DefaultTabController(
      length: 2,
      initialIndex: tab,
      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Bus ${line.displayNumber}'),
              actions: [
                // Itinéraire de la variante courante sur la carte.
                IconButton(
                  tooltip: 'Voir l’itinéraire sur la carte',
                  icon: const Icon(Icons.map_outlined),
                  onPressed: () {
                    final variant = _currentVariant;
                    if (variant == null ||
                        variant.roadMap.isEmpty) {
                      Get.snackbar(
                        'Itinéraire indisponible',
                        'Les arrêts de ce sens sont en cours de rattachement.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }
                    Get.to(
                      () => _ItineraryMapScreen(variant: variant),
                      fullscreenDialog: true,
                    );
                  },
                ),
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.fromLTRB(20, 12, 20, 4),
                  child: _SegmentedControl(
                    tabController: tabController,
                    onSelect: (i) => setState(() => tab = i),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _DirectionTab(
                        key: ValueKey('aller_${line.number}'),
                        variants:
                            allers.isNotEmpty ? allers : [line],
                        selected: allerIdx,
                        onSelect: (i) =>
                            setState(() => allerIdx = i),
                        emptyTitle: 'Aucun itinéraire aller',
                        showEmpty: allers.isEmpty,
                      ),
                      _DirectionTab(
                        key: ValueKey('retour_${line.number}'),
                        variants: retours,
                        selected: retourIdx,
                        onSelect: (i) =>
                            setState(() => retourIdx = i),
                        emptyTitle: 'Pas de sens retour renseigné',
                        showEmpty: retours.isEmpty,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Sélecteur Aller / Retour façon segmented control : pastille animée
/// (borderRadius) qui glisse vers l'onglet tapé.
class _SegmentedControl extends StatelessWidget {
  final TabController tabController;
  final ValueChanged<int> onSelect;

  const _SegmentedControl({
    required this.tabController,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    const labels = ['Aller', 'Retour'];
    return AnimatedBuilder(
      animation: tabController.animation!,
      builder: (context, _) {
        final t = tabController.animation!.value.clamp(0.0, 1.0);
        final current = t.round();
        return LayoutBuilder(
          builder: (context, constraints) {
            final pillW = (constraints.maxWidth - 8) / 2;
            return Container(
              decoration: BoxDecoration(
                color: scheme.surfaceContainerHighest
                    .withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOut,
                    left: 4 + t * pillW,
                    top: 4,
                    bottom: 4,
                    width: pillW,
                    child: Container(
                      decoration: BoxDecoration(
                        color: scheme.primary,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: scheme.primary
                                .withValues(alpha: 0.35),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      for (var i = 0; i < 2; i++)
                        Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              tabController.animateTo(i);
                              onSelect(i);
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                      vertical: 12),
                              alignment: Alignment.center,
                              child: Text(
                                labels[i],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: current == i
                                          ? scheme.onPrimary
                                          : scheme.onSurfaceVariant,
                                    ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

/// Contenu d'un sens : variante + timeline + proximité.
class _DirectionTab extends StatelessWidget {
  final List<BusFromDb> variants;
  final int selected;
  final ValueChanged<int> onSelect;
  final String emptyTitle;
  final bool showEmpty;

  const _DirectionTab({
    super.key,
    required this.variants,
    required this.selected,
    required this.onSelect,
    required this.emptyTitle,
    this.showEmpty = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    if (showEmpty) {
      return AppEmptyView(
        icon: Icons.route_outlined,
        title: emptyTitle,
        subtitle: 'Les arrêts de ce sens sont en cours de rattachement.',
      );
    }
    final variant =
        variants[selected.clamp(0, variants.length - 1)];
    final controller = Get.find<BusController>();
    final distances = _distances(controller, variant);
    final nearest = _nearest(variant, distances);
    return RefreshIndicator(
      onRefresh: controller.getAllBus,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sélecteur de variante (branches d'un même sens).
            if (variants.length > 1) ...[
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (var i = 0; i < variants.length; i++)
                    ChoiceChip(
                      label:
                          Text('Variante ${variants[i].variantIndex}'),
                      selected: i == selected,
                      onSelected: (_) => onSelect(i),
                    ),
                ],
              ),
              const SizedBox(height: 12),
            ],
            // Fiche variante.
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: scheme.primary,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    variant.displayNumber,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(variant.source,
                          style: theme.textTheme.titleMedium),
                      Text('↔ ${variant.destination}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                              color: scheme.onSurfaceVariant)),
                      if (variant.variantLabel.isNotEmpty)
                        Text(variant.variantLabel,
                            style: theme.textTheme.bodySmall?.copyWith(
                                color: scheme.onSurfaceVariant)),
                    ],
                  ),
                ),
                if (variant.isActive) StatusBadge.active(context),
              ],
            ),
            // Arrêt le plus proche (si GPS connu).
            if (nearest != null) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.near_me_outlined,
                        size: 18, color: Colors.green),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Arrêt le plus proche : ${nearest.name} '
                        '(${_formatDistance(nearest.distance)})',
                        style: theme.textTheme.bodySmall?.copyWith(
                            color: scheme.onSurface,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 16),
            Text('Arrêts (${variant.roadMap.length})',
                style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            if (variant.roadMap.isEmpty)
              Text('Itinéraire en cours de rattachement : '
                  'les arrêts de cette variante arrivent bientôt.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                      color: scheme.onSurfaceVariant))
            else
              _StopsTimeline(
                variant: variant,
                distances: distances,
              ),
            // Suivi temps réel si la variante roule.
            if (variant.isActive) ...[
              const SizedBox(height: 16),
              AppButton(
                title: 'Suivre en direct',
                variant: AppButtonVariant.primary,
                onPressed: () => _followLive(controller, variant),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Map<int, double> _distances(
      BusController controller, BusFromDb variant) {
    final lat = double.tryParse(controller.userLatitude.value);
    final lng = double.tryParse(controller.userLongitude.value);
    if (lat == null || lng == null) return {};
    final map = <int, double>{};
    for (var i = 0; i < variant.roadMap.length; i++) {
      final s = variant.roadMap[i];
      map[i] = Geolocator.distanceBetween(lat, lng, s.lat, s.long);
    }
    return map;
  }

  _NearestStop? _nearest(
      BusFromDb variant, Map<int, double> distances) {
    if (distances.isEmpty) return null;
    var best = distances.entries.first;
    for (final e in distances.entries) {
      if (e.value < best.value) best = e;
    }
    if (best.value > kNearbyThresholdMeters) return null;
    final stop = variant.roadMap[best.key];
    return _NearestStop(
        name: stop.displayName(best.key), distance: best.value);
  }

  Future<void> _followLive(
      BusController controller, BusFromDb variant) async {
    controller.currentBus.value = variant;
    controller.resetSecondFit();
    controller.resetDetailFit();
    Get.toNamed(Paths.secondHomeBus);
    controller.getRoutes(variant.roadMap).then((r) {
      controller.routes = r;
      controller.update();
    });
  }
}

class _NearestStop {
  final String name;
  final double distance;
  const _NearestStop({required this.name, required this.distance});
}

String _formatDistance(double meters) {
  if (meters < 1000) return 'à ${meters.round()} m';
  return 'à ${(meters / 1000).toStringAsFixed(1)} km';
}

/// Timeline verticale avec badge "Proche" sur les arrêts à moins
/// de [kNearbyThresholdMeters] (ordre de l'itinéraire conservé).
class _StopsTimeline extends StatelessWidget {
  final BusFromDb variant;
  final Map<int, double> distances;

  const _StopsTimeline({required this.variant, required this.distances});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: variant.roadMap.length,
      itemBuilder: (context, index) {
        final stop = variant.roadMap[index];
        final isLast = index == variant.roadMap.length - 1;
        final dist = distances[index];
        final nearby = dist != null && dist <= kNearbyThresholdMeters;
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: nearby
                          ? Colors.green
                          : (index == 0
                              ? scheme.primary
                              : scheme.surface),
                      border: Border.all(
                          color: nearby
                              ? Colors.green
                              : scheme.primary,
                          width: 2.5),
                      shape: BoxShape.circle,
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                          width: 2.5,
                          color: nearby
                              ? Colors.green.withValues(alpha: 0.4)
                              : scheme.primaryContainer),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: isLast ? 0 : 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(stop.displayName(index),
                          style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: nearby
                                  ? FontWeight.w700
                                  : null)),
                      if (dist != null &&
                          dist <= kNearbyThresholdMeters) ...[
                        const SizedBox(height: 2),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.green
                                .withValues(alpha: 0.14),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Proche • ${_formatDistance(dist)}',
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Colors.green),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Carte plein écran de l'itinéraire : tracé + arrêts + ma position.
class _ItineraryMapScreen extends StatefulWidget {
  final BusFromDb variant;

  const _ItineraryMapScreen({required this.variant});

  @override
  State<_ItineraryMapScreen> createState() => _ItineraryMapScreenState();
}

class _ItineraryMapScreenState extends State<_ItineraryMapScreen> {
  late final MapController mapController = MapController();

  /// Cadrage auto une seule fois (les rebuilds live suivants
  /// préservent le zoom manuel de l'utilisateur).
  bool _fittedOnce = false;

  @override
  void dispose() {
    try {
      mapController.dispose();
    } catch (_) {}
    super.dispose();
  }

  void _showStop(int i) {
    final scheme = Theme.of(context).colorScheme;
    Get.defaultDialog(
      title: widget.variant.roadMap[i].displayName(i),
      middleText:
          'Bus ${widget.variant.displayNumber} • ${widget.variant.source} ↔ ${widget.variant.destination}',
      textConfirm: 'OK',
      confirmTextColor: Colors.white,
      buttonColor: scheme.primary,
      onConfirm: () => Get.back(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final controller = Get.find<BusController>();
    final stored = widget.variant.routeGeometry;
    final routePoints = (stored != null && stored.length >= 2)
        ? [
            for (final p in stored)
              if (p.length >= 2)
                lngLatToLatLng(p, 5.3502292, -3.9881887),
          ]
        : [
            for (final s in widget.variant.roadMap)
              LatLng(s.lat, s.long),
          ];
    final userLat =
        double.tryParse(controller.userLatitude.value);
    final userLng =
        double.tryParse(controller.userLongitude.value);
    final userPos =
        (userLat != null && userLng != null) ? LatLng(userLat, userLng) : null;
    final center =
        routePoints.isNotEmpty ? routePoints.first : const LatLng(5.35, -3.99);
    // Cadrage initial sur le tracé seul (vue serrée : les arrêts
    // restent distinguables). Ma position reste affichée ; le bouton
    // "voir les deux" élargit au besoin.
    if (!_fittedOnce) {
      _fittedOnce = true;
      fitWhenReady(
        mapController,
        [
          ...routePoints,
          for (final s in widget.variant.roadMap)
            LatLng(s.lat, s.long),
        ],
        maxZoom: 14,
      );
    }
    final fitPoints = <LatLng>[
      ...routePoints,
      for (final s in widget.variant.roadMap) LatLng(s.lat, s.long),
    ];
    if (userPos != null) fitPoints.add(userPos);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Itinéraire ${widget.variant.displayNumber} • ${widget.variant.directionLabel}'),
      ),
      body: Obx(() {
        // Bus en service sur cette ligne, situés par leur position live.
        final live = controller.activeBusList
            .where((b) =>
                b.number == widget.variant.number &&
                b.position != null)
            .toList();
        final distances =
            _stopDistances(controller, widget.variant);
        return Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: center,
                initialZoom: 14,
                minZoom: 3,
                maxZoom: 18,
              ),
              children: [
                const AppTileLayer(),
                if (routePoints.length >= 2)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: routePoints,
                        color: scheme.primary,
                        strokeWidth: 6,
                      ),
                    ],
                  ),
                MarkerLayer(
                  markers: [
                    // Pastilles d'arrêts fines (style point localisé),
                    // tap -> nom de l'arrêt.
                    for (var i = 0;
                        i < widget.variant.roadMap.length;
                        i++)
                      Marker(
                        point: LatLng(
                            widget.variant.roadMap[i].lat,
                            widget.variant.roadMap[i].long),
                        width: 22,
                        height: 22,
                        child: _StopPin(
                          isStart: i == 0,
                          isEnd: i ==
                              widget.variant.roadMap.length - 1,
                          onTap: () => _showStop(i),
                        ),
                      ),
                    // Bus en service sur la ligne (épingles live).
                    for (final b in live)
                      Marker(
                        point: LatLng(b.position!.lat,
                            b.position!.long),
                        width: 48,
                        height: 60,
                        alignment: Alignment.topCenter,
                        child: GestureDetector(
                          onTap: () => Get.defaultDialog(
                            title:
                                'Bus ${b.displayNumber} en service',
                            middleText:
                                '${b.source} ↔ ${b.destination}',
                            textConfirm: 'OK',
                            confirmTextColor: Colors.white,
                            buttonColor: scheme.primary,
                            onConfirm: () => Get.back(),
                          ),
                          child: BusPin(label: b.displayNumber),
                        ),
                      ),
                  ],
                ),
                const CurrentLocationLayer(
                  alignPositionOnUpdate: AlignOnUpdate.never,
                ),
                const MapCredits(),
              ],
            ),
            // Bandeau sens + compteurs.
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: scheme.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: scheme.outline),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.directions_bus_filled,
                        size: 18, color: scheme.primary),
                    const SizedBox(width: 6),
                    Text(
                      '${widget.variant.displayNumber} • ${widget.variant.directionLabel}',
                      style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w800),
                    ),
                    if (live.isNotEmpty) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green
                              .withValues(alpha: 0.14),
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${live.length} en service',
                          style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Colors.green),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            CenterOnMeButton(
              mapController: mapController,
              heroTag: 'locate_line_itinerary',
            ),
            FitPointsButton(
              mapController: mapController,
              heroTag: 'fit_line_itinerary',
              pointsOf: () => fitPoints,
            ),
            MapSheet(
              initialSize: 0.32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SheetTitle(
                    title: 'Arrêts (${widget.variant.roadMap.length})',
                    subtitle:
                        '${widget.variant.source} → ${widget.variant.destination}',
                  ),
                  const SizedBox(height: 8),
                  _StopsTimeline(
                    variant: widget.variant,
                    distances: distances,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

/// Pastille d'arrêt fine : point localisé (cœur + anneau blanc),
/// vert pour le départ, rouge pour l'arrivée.
class _StopPin extends StatelessWidget {
  final bool isStart;
  final bool isEnd;
  final VoidCallback onTap;

  const _StopPin({
    required this.isStart,
    required this.onTap,
    this.isEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = isStart
        ? Colors.green
        : (isEnd ? scheme.error : scheme.primary);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 4,
            ),
          ],
        ),
        child: const Center(
          child: SizedBox(
            width: 5,
            height: 5,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Distances utilisateur -> arrêts (mètres), {} si GPS inconnu.
Map<int, double> _stopDistances(
    BusController controller, BusFromDb variant) {
  final lat = double.tryParse(controller.userLatitude.value);
  final lng = double.tryParse(controller.userLongitude.value);
  if (lat == null || lng == null) return {};
  final map = <int, double>{};
  for (var i = 0; i < variant.roadMap.length; i++) {
    final s = variant.roadMap[i];
    map[i] = Geolocator.distanceBetween(lat, lng, s.lat, s.long);
  }
  return map;
}
