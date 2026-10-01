import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobility/models/stop/stop.dart';

/// Bouton "ma position" à poser dans le Stack d'une carte (haut-droite).
/// Centre la caméra sur le GPS (heroTag unique obligatoire : plusieurs
/// cartes coexistent dans l'arbre).
class CenterOnMeButton extends StatelessWidget {
  final MapController mapController;
  final String heroTag;

  const CenterOnMeButton({
    super.key,
    required this.mapController,
    required this.heroTag,
  });

  Future<void> _center() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        await Geolocator.openLocationSettings();
        return;
      }
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }
      final pos = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );
      mapController.move(LatLng(pos.latitude, pos.longitude), 16);
    } catch (_) {
      Get.snackbar(
        'Localisation indisponible',
        'Vérifiez le GPS et la permission de localisation.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Positioned(
      // Sous la zone système (cartes plein écran sans SafeArea haute).
      top: 16 + MediaQuery.of(context).padding.top,
      right: 12,
      child: FloatingActionButton.small(
        heroTag: heroTag,
        tooltip: 'Ma position',
        backgroundColor: scheme.surface,
        foregroundColor: scheme.primary,
        onPressed: _center,
        child: const Icon(Icons.my_location),
      ),
    );
  }
}

/// Bouton "voir les deux" à poser dans le Stack d'une carte (sous le
/// bouton "ma position") : recadre pour inclure [pointsOf] (ex. position
/// recherchée + ma position), avec une marge basse pour le bottom-sheet.
/// L'utilisateur peut ensuite zoomer librement pour plus de détails.
class FitPointsButton extends StatelessWidget {
  final MapController mapController;
  final List<LatLng> Function() pointsOf;
  final String heroTag;
  final double topOffset;

  const FitPointsButton({
    super.key,
    required this.mapController,
    required this.pointsOf,
    required this.heroTag,
    this.topOffset = 72,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Positioned(
      top: topOffset + MediaQuery.of(context).padding.top,
      right: 12,
      child: FloatingActionButton.small(
        heroTag: heroTag,
        tooltip: 'Voir les deux points',
        backgroundColor: scheme.surface,
        foregroundColor: scheme.primary,
        onPressed: () => fitMapToPoints(mapController, pointsOf()),
        child: const Icon(Icons.fit_screen_outlined),
      ),
    );
  }
}
/// Clé Stadia (gratuite, sans CB : stadiamaps.com > propriété > clé API).
/// Absente = fond Esri sans clé (volontairement minimaliste).
String get _stadiaKey =>
    dotenv.isInitialized ? (dotenv.maybeGet('STADIA_API_KEY') ?? '') : '';

bool get _hasStadiaKey => _stadiaKey.isNotEmpty;

/// Fond de carte :
/// - avec clé Stadia gratuite : style Google (Alidade Smooth) ;
/// - sans clé : OSM standard détaillé (nos POI et nos arrêts par-dessus).
/// Secours automatique : Esri Grey si le primaire ne répond pas.
class AppTileLayer extends StatelessWidget {
  const AppTileLayer({super.key});

  static const _osmFallback = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
  // Ordre Esri : {z}/{y}/{x}. Niveaux 0-16 (upscale au-delà, jamais blanc).
  static const _esriFallback =
      'https://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}';

  @override
  Widget build(BuildContext context) {
    if (_hasStadiaKey) {
      return TileLayer(
        urlTemplate:
            'https://tiles.stadiamaps.com/tiles/osm_bright/{z}/{x}/{y}.png?api_key=$_stadiaKey',
        userAgentPackageName: 'com.example.mobility',
        maxZoom: 20,
        maxNativeZoom: 20,
        fallbackUrl: _osmFallback,
      );
    }
    return TileLayer(
      urlTemplate: _osmFallback,
      userAgentPackageName: 'com.example.mobility',
      maxZoom: 19,
      maxNativeZoom: 19,
      fallbackUrl: _esriFallback,
    );
  }
}

/// Attribution selon le fond actif (licence des tuiles).
class MapCredits extends StatelessWidget {
  const MapCredits({super.key});

  @override
  Widget build(BuildContext context) {
    return RichAttributionWidget(
      attributions: [
        if (_hasStadiaKey) ...[
          const TextSourceAttribution('© Stadia Maps'),
          const TextSourceAttribution('© OpenMapTiles'),
        ] else
          const TextSourceAttribution('© Esri'),
        const TextSourceAttribution('© OpenStreetMap contributors'),
      ],
    );
  }
}

/// Épingle bus avec numéro (widget Flutter, aucune génération native).
class BusPin extends StatelessWidget {
  final String label;
  final double height;
  final Color background;

  const BusPin({
    super.key,
    required this.label,
    this.height = 68,
    this.background = const Color(0xFF0B6B4F),
  });

  @override
  Widget build(BuildContext context) {
    final width = height * 0.78;
    return ZoomScaled(
      baseWidth: width,
      baseHeight: height,
      child: SizedBox(
        width: width,
        height: height,
        child: CustomPaint(
          painter: _PinPainter(background),
          child: Align(
            alignment: const Alignment(0, -0.42),
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: label.length <= 2 ? height * 0.26 : height * 0.21,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PinPainter extends CustomPainter {
  final Color color;
  _PinPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final r = size.width / 2 - 3;
    final cy = r + 3;
    final fill = Paint()..color = color;
    // Pointeur (ui.Path : flutter_map exporte aussi un type Path).
    canvas.drawPath(
      ui.Path()
        ..moveTo(cx - r * 0.72, cy + r * 0.42)
        ..lineTo(cx, size.height - 2)
        ..lineTo(cx + r * 0.72, cy + r * 0.42)
        ..close(),
      fill,
    );
    // Disque + anneau.
    canvas.drawCircle(Offset(cx, cy), r, fill);
    canvas.drawCircle(
      Offset(cx, cy),
      r,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Mise à l'échelle auto d'une épingle selon le zoom (comme le point
/// "ma position") : taille réelle à [refZoom], rétrécie en dézoomant
/// (jamais sous [minScale]). L'ancrage est préservé (mise à l'échelle
/// centrée dans une boîte de taille fixe).
/// Les enfants de Marker se reconstruisent à chaque mouvement de carte,
/// donc le zoom lu ici est toujours frais.
class ZoomScaled extends StatelessWidget {
  final double baseWidth;
  final double baseHeight;
  final Widget child;
  final double refZoom;
  final double minScale;

  const ZoomScaled({
    super.key,
    required this.baseWidth,
    required this.baseHeight,
    required this.child,
    this.refZoom = 15,
    this.minScale = 0.35,
  });

  /// Variante carrée.
  const ZoomScaled.square({
    super.key,
    required double baseSize,
    required this.child,
    this.refZoom = 15,
    this.minScale = 0.35,
  })  : baseWidth = baseSize,
        baseHeight = baseSize;

  @override
  Widget build(BuildContext context) {
    double zoom;
    try {
      zoom = MapCamera.of(context).zoom;
    } catch (_) {
      zoom = refZoom;
    }
    final s = math.pow(2.0, zoom - refZoom)
        .clamp(minScale, 1.0)
        .toDouble();
    return SizedBox(
      width: baseWidth,
      height: baseHeight,
      child: Center(
        child: Transform.scale(
          scale: s,
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}

/// Pastille d'arrêt (tap ->Callback, ex. dialogue avec le nom).
class StopDot extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;

  const StopDot({super.key, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ZoomScaled.square(
      baseSize: 18,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: color ?? scheme.surface,
            border: Border.all(color: scheme.primary, width: 4),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

/// Pastille d'arrêt fine pour les cartes d'itinéraire (passager comme
/// chauffeur) : point localisé (cœur + anneau blanc + pastille centrale),
/// vert pour le départ, rouge pour l'arrivée, primaire sinon.
class RouteStopPin extends StatelessWidget {
  final bool isStart;
  final bool isEnd;
  final VoidCallback onTap;
  final double size;

  const RouteStopPin({
    super.key,
    required this.isStart,
    required this.onTap,
    this.isEnd = false,
    this.size = 22,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = isStart
        ? Colors.green
        : (isEnd ? scheme.error : scheme.primary);
    return ZoomScaled.square(
      baseSize: size,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size,
          height: size,
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
          child: Center(
            child: SizedBox(
              width: size * 0.23,
              height: size * 0.23,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------- Conversions ----------

LatLng stopToLatLng(Stop s) => LatLng(s.lat, s.long);

/// Paire [lng,lat] (format stocké / OSRM) -> LatLng.
LatLng lngLatToLatLng(List point, double fallbackLat, double fallbackLng) {
  if (point.length < 2) return LatLng(fallbackLat, fallbackLng);
  final lng = point[0] is num
      ? (point[0] as num).toDouble()
      : double.tryParse(point[0].toString()) ?? fallbackLng;
  final lat = point[1] is num
      ? (point[1] as num).toDouble()
      : double.tryParse(point[1].toString()) ?? fallbackLat;
  return LatLng(lat, lng);
}

// ---------- Cadrage "voir les deux points" ----------

/// Marge par défaut : réserve la zone du bottom-sheet en bas et la zone
/// système en haut pour que les deux épingles restent visibles.
/// Volontairement modérée : une marge trop grande force un dézoom qui
/// affiche des tuiles vides/grises (surtout pour les points éloignés).
const EdgeInsets kFitPadding = EdgeInsets.fromLTRB(48, 90, 48, 300);

/// Zoom minimal d'un cadrage auto : en dessous, la carte n'affiche plus
/// que des tuiles lointaines (impression de "map grise"). Si les points
/// ne tiennent pas à ce niveau, la caméra se centre entre eux à ce zoom
/// plancher plutôt que de dézoomer vers une vue monde vide.
const double kFitMinZoom = 11.0;

/// Enveloppe de [points] (ignore les points invalides).
LatLngBounds? boundsOf(List<LatLng> points) {
  final valid = points
      .where((p) =>
          p.latitude.isFinite &&
          p.longitude.isFinite &&
          p.latitude.abs() <= 90 &&
          p.longitude.abs() <= 180)
      .toList();
  if (valid.isEmpty) return null;
  return LatLngBounds.fromPoints(valid);
}

/// Vrai si les deux points sont quasi confondus (< ~150 m) : un simple
/// centrage zoomé est alors plus lisible qu'un fit (qui dézoomerait trop).
bool _areClose(LatLng a, LatLng b) =>
    (a.latitude - b.latitude).abs() < 0.0012 &&
    (a.longitude - b.longitude).abs() < 0.0012;

/// Recadre [ctrl] pour inclure tous les [points] (position recherchée +
/// ma position en général). Si les points sont confondus, centre avec
/// un zoom lisible. Ne fait rien si aucun point valide.
/// Le zoom libre de l'utilisateur est préservé ensuite (appel unique).
/// Retourne vrai si le recadrage a été appliqué (faux si le controller
/// n'est pas encore attaché à une carte — voir [fitWhenReady]).
bool fitMapToPoints(
  MapController ctrl,
  List<LatLng> points, {
  EdgeInsets padding = kFitPadding,
  double closeZoom = 15,
  double maxZoom = 15,
  double minZoom = kFitMinZoom,
}) {
  final bounds = boundsOf(points);
  if (bounds == null) return false;
  try {
    if (points.length == 1 || _areClose(bounds.southWest, bounds.northEast)) {
      return ctrl.move(bounds.center, closeZoom);
    }
    return ctrl.fitCamera(
      CameraFit.bounds(
        bounds: bounds,
        padding: padding,
        maxZoom: maxZoom,
        minZoom: minZoom,
      ),
    );
  } catch (_) {
    return false;
  }
}

/// Applique [fitMapToPoints] dès que le controller est attaché à sa carte,
/// avec réessais (la carte n'existe pas encore pendant le premier build).
/// Sans réessai, un appel trop précoce est perdu et la carte reste figée
/// sur sa vue initiale (ex. fond gris pour un point éloigné).
void fitWhenReady(
  MapController ctrl,
  List<LatLng> points, {
  EdgeInsets padding = kFitPadding,
  double closeZoom = 15,
  double maxZoom = 15,
  double minZoom = kFitMinZoom,
  int maxAttempts = 6,
  Duration retryDelay = const Duration(milliseconds: 250),
}) {
  var attempts = 0;
  void attempt() {
    attempts++;
    final ok = fitMapToPoints(
      ctrl,
      points,
      padding: padding,
      closeZoom: closeZoom,
      maxZoom: maxZoom,
      minZoom: minZoom,
    );
    if (!ok && attempts < maxAttempts) {
      Future.delayed(retryDelay, attempt);
    }
  }

  WidgetsBinding.instance.addPostFrameCallback((_) => attempt());
}

/// Fit initial (avant le premier rendu) pour les mêmes points :
/// à passer à `MapOptions(initialCameraFit: ...)`.
CameraFit initialFitFor(
  List<LatLng> points, {
  EdgeInsets padding = kFitPadding,
  double maxZoom = 15,
}) {
  final bounds = boundsOf(points);
  // Fallback : Abidjan centre (jamais de crash si liste vide).
  final safe =
      bounds ?? LatLngBounds(const LatLng(5.35, -3.99), const LatLng(5.35, -3.99));
  return CameraFit.bounds(bounds: safe, padding: padding, maxZoom: maxZoom);
}
