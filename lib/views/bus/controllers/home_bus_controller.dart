import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../common/help_functions/help_functions.dart';
import '../../../common/map/fm_widgets.dart';
import '../../../models/bus/bus_from_realTime/bus_from_db.dart';
import '../../../models/stop/stop.dart';
import '../../../services/routing/route_provider.dart';
import '../../../data/repositories/BusRepository/bus_repository_impl.dart';

class BusController extends GetxController {
  //home Bus
  final TextEditingController textEditingController = TextEditingController();

  BusRepositoryImpl busRepository = BusRepositoryImpl();
  RxBool isLoading = true.obs;
  late final RxBool isConnect = false.obs;
  // RxList : toute mutation notifie les Obx (recherche, live, refresh).
  RxList<BusFromDb> activeBusList = <BusFromDb>[].obs;
  RxList<BusFromDb> availableActiveBusList = <BusFromDb>[].obs;
  RxList<BusFromDb> searchActiveBus = <BusFromDb>[].obs;
  RxList<BusFromDb> listAllBus = <BusFromDb>[].obs;

  List<dynamic> routes = <Stop>[].obs;
  Rx<BusFromDb> currentBus = BusFromDb(
          number: 0,
          source: "",
          destination: "",
          isActive: false,
          roadMap: [],
          position: Stop(lat: 0, long: 0),
          startDate: DateTime.now(),
          driverUid: null,
          lastSeen: null,
          routeGeometry: null)
      .obs;

  // second home Bus
  late StreamSubscription<Position> streamSubscription;
  StreamSubscription<List<BusFromDb>>? _liveBusSubscription;

  /// Un MapController PAR carte : partager un seul controller entre deux
  /// FlutterMap vivantes (SecondHome sous Détail) croise les notifications
  /// pendant les builds (setState during build).
  final MapController secondMapController = MapController();
  final MapController detailMapController = MapController();

  var userLatitude = "5.3502292".obs, userLongitude = "-3.9881887".obs;

  /// Dernière position suivie par chaque caméra (évite de recentrer si
  /// le bus n'a pas bougé). Déplacements post-frame (interdits en build).
  LatLng? lastFollowedBusPos;
  LatLng? lastFollowedSecondPos;

  /// Dernier couple (bus, user) déjà cadré par carte : évite de rejouer
  /// un fit à chaque tick GPS et de casser le zoom manuel de l'utilisateur.
  /// Le recadrage ne rejoue que si le bus OU l'utilisateur a vraiment bougé
  /// (~300 m) ou si la cible suivie a changé (nouvelle recherche).
  LatLng? _lastFitSecondBus;
  LatLng? _lastFitSecondUser;
  LatLng? _lastFitDetailBus;
  LatLng? _lastFitDetailUser;

  static bool _movedEnough(LatLng? prev, LatLng next) {
    if (prev == null) return true;
    return (next.latitude - prev.latitude).abs() > 0.0027 ||
        (next.longitude - prev.longitude).abs() > 0.0027;
  }

  void _fitBothOn(
    MapController ctrl,
    LatLng bus,
    LatLng user,
    LatLng? lastBus,
    LatLng? lastUser,
    void Function() save,
  ) {
    if (!_movedEnough(lastBus, bus) && !_movedEnough(lastUser, user)) return;
    save();
    fitWhenReady(ctrl, [bus, user]);
  }

  /// Cadre SecondHome sur bus + utilisateur (toujours les deux visibles).
  void fitSecondOnBoth(LatLng bus, LatLng user) => _fitBothOn(
        secondMapController,
        bus,
        user,
        _lastFitSecondBus,
        _lastFitSecondUser,
        () {
          _lastFitSecondBus = bus;
          _lastFitSecondUser = user;
        },
      );

  /// Cadre le détail sur bus + utilisateur (toujours les deux visibles).
  void fitDetailOnBoth(LatLng bus, LatLng user) => _fitBothOn(
        detailMapController,
        bus,
        user,
        _lastFitDetailBus,
        _lastFitDetailUser,
        () {
          _lastFitDetailBus = bus;
          _lastFitDetailUser = user;
        },
      );

  /// Force le recadrage au prochain appel (changement de bus recherché).
  void resetSecondFit() {
    _lastFitSecondBus = null;
    _lastFitSecondUser = null;
  }

  /// Force le recadrage au prochain appel (changement de bus recherché).
  void resetDetailFit() {
    _lastFitDetailBus = null;
    _lastFitDetailUser = null;
  }

  void _followOn(MapController ctrl, LatLng? last, LatLng target,
      void Function(LatLng) save) {
    if (last != null &&
        (target.latitude - last.latitude).abs() < 0.0002 &&
        (target.longitude - last.longitude).abs() < 0.0002) {
      return;
    }
    save(target);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        ctrl.move(target, ctrl.camera.zoom);
      } catch (_) {}
    });
  }

  /// Centre la caméra du détail sur le bus en direct.
  void followBusPosition(LatLng target) =>
      _followOn(detailMapController, lastFollowedBusPos, target,
          (p) => lastFollowedBusPos = p);

  /// Centre la caméra de SecondHome sur le bus suivi.
  void followSecondPosition(LatLng target) =>
      _followOn(secondMapController, lastFollowedSecondPos, target,
          (p) => lastFollowedSecondPos = p);

  @override
  void onInit() async {
    super.onInit();
    isConnect.value = await HelpFunctions.checkConnectivity();
    await getAllBus();
    // Temps réel Firestore : met à jour la liste à chaque position chauffeur.
    // Les bus périmés (heartbeat trop vieux = app chauffeur tuée) sont exclus.
    // Le bus suivi (currentBus) est resynchronisé pour afficher la position
    // temps réel sur la carte (même numéro, même chauffeur si connu).
    _liveBusSubscription = busRepository.watchActiveBus().listen(
      (live) {
        final fresh =
            live.where((b) => b.isFresh()).toList();
        activeBusList.assignAll(fresh);
        availableActiveBusList.assignAll(_mergedAvailable());
        final cur = currentBus.value;
        if (cur.number != 0) {
          final sameNumber =
              fresh.where((b) => b.number == cur.number).toList();
          if (sameNumber.isNotEmpty) {
            var pick = sameNumber.first;
            if (cur.driverUid != null) {
              for (final b in sameNumber) {
                if (b.driverUid == cur.driverUid) {
                  pick = b;
                  break;
                }
              }
            }
            currentBus.value = pick;
          }
        }
        update();
      },
      onError: (_) {},
    );
    getLocation();
  }

  @override
  void onReady() {
    super.onReady();
    getLocation();
  }

  @override
  void onClose() {
    try {
      streamSubscription.cancel();
    } catch (_) {}
    try {
      _liveBusSubscription?.cancel();
    } catch (_) {}
    textEditingController.dispose();
    try {
      secondMapController.dispose();
    } catch (_) {}
    try {
      detailMapController.dispose();
    } catch (_) {}
    super.onClose();
  }

// home Bus
  final RxString errorMessage = "".obs;

  // --- Mini-dashboard lignes ---
  // Filtre d'affichage : 'all' (toutes les variantes) | 'active' (service).
  final RxString lineFilter = 'all'.obs;

  /// Nombre de bus en service (temps réel).
  int get activeCount => activeBusList.length;

  /// Nombre de lignes distinctes au référentiel.
  int get lineCount {
    final nums = <int>{};
    for (final b in listAllBus) {
      nums.add(b.number);
    }
    return nums.length;
  }

  /// Liste affichée par le dashboard (recherche + filtre).
  /// Mode 'all' : une ligne par variante, sens aller uniquement.
  /// Mode 'active' : bus en service (tous sens, temps réel).
  List<BusFromDb> get dashboardBuses {
    final base = availableActiveBusList.toList();
    if (lineFilter.value == 'active') {
      return base.where((b) => b.isActive).toList();
    }
    return base.where((b) => !isRetour(b)).toList();
  }

  void setLineFilter(String f) {
    lineFilter.value = f;
    update();
  }

  /// Vrai pour les variantes retour (exclues de la liste des lignes).
  /// Les docs historiques sans sens restent visibles (compat).
  static bool isRetour(BusFromDb b) =>
      b.direction.trim().toLowerCase() == 'retour';

  /// Toutes les variantes d'une ligne (live prioritaire), aller d'abord.
  List<BusFromDb> variantsOf(int number) {
    final list = _mergedAvailable()
        .where((b) => b.number == number)
        .toList();
    list.sort((a, b) {
      final dir = _directionRank(a).compareTo(_directionRank(b));
      if (dir != 0) return dir;
      return a.variantIndex.compareTo(b.variantIndex);
    });
    return list;
  }

  static int _directionRank(BusFromDb b) =>
      isRetour(b) ? 1 : 0;

  /// Distance utilisateur -> arrêt (mètres), null si GPS inconnu.
  double? distanceToStop(Stop s) {
    final lat = double.tryParse(userLatitude.value);
    final lng = double.tryParse(userLongitude.value);
    if (lat == null || lng == null) return null;
    return Geolocator.distanceBetween(lat, lng, s.lat, s.long);
  }

  Future<void> getAllBus() async {
    isLoading(true);
    errorMessage.value = "";
    final activeResult = await busRepository.getActiveBus();
    final allResult = await busRepository.getAllBus();

    activeResult.fold(
      (l) => errorMessage.value = l.userMessage,
      (r) => activeBusList
          .assignAll(r.where((b) => b.isFresh())),
    );
    allResult.fold(
      (l) => errorMessage.value = l.userMessage,
      (r) => listAllBus.assignAll(r),
    );

    availableActiveBusList.assignAll(_mergedAvailable());

    isLoading(false);
    update();
    if (errorMessage.value.isNotEmpty) {
      HelpFunctions.customSnackbar(
        title: 'Erreur',
        message: errorMessage.value,
        colorText: Colors.red,
        icon: Icons.error_outline,
      );
    }
  }

  /// Clé d'une variante (numéro + sens + index) : une variante en
  /// service et sa fiche statique partagent la même clé.
  static String _variantKey(BusFromDb b) =>
      '${b.number}_${b.direction}_${b.variantIndex}';

  /// Live + référentiel sans doublons : la version en service prime sur
  /// la fiche statique de la même variante (sinon chaque bus en service
  /// apparaît 2 fois dans la liste et dans la recherche).
  List<BusFromDb> _mergedAvailable() {
    final seen = <String>{};
    final merged = <BusFromDb>[];
    for (final b in [...activeBusList, ...listAllBus]) {
      if (seen.add(_variantKey(b))) merged.add(b);
    }
    return merged;
  }

  Future<void> getBusByNumber(int busNumber) async {    final query = busNumber.toString();
    searchActiveBus.assignAll(_mergedAvailable().where((bus) =>
        bus.number.toString().contains(query) ||
        bus.lineLabel.contains(query)));
    availableActiveBusList.assignAll(searchActiveBus);
    update();
  }

  Future<void> getLocation() async {
    bool serviceEnabled;

    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      userLatitude.value = "${position.latitude}";
      userLongitude.value = "${position.longitude}";
      // getAddressFromLatLang(position);
    });
  }

  /// Tracé d'une ligne SANS appel Mapbox :
  /// 1. géométrie précalculée du bus courant (backfill Firestore),
  /// 2. OSRM gratuit sur les arrêts,
  /// 3. ligne droite (fallback, jamais d'écran vide si roadMap connue).
  Future<List<dynamic>> getRoutes(List<Stop> source) async {
    try {
      final stored = currentBus.value.routeGeometry;
      if (stored != null && stored.length >= 2) return stored;
      if (source.isEmpty) return [];
      final points = source.map((e) => [e.long, e.lat]).toList();
      final osrm = await RouteProvider.osrmRoute(points);
      if (osrm.length >= 2) return osrm;
      return RouteProvider.straightThrough(source);
    } catch (_) {
      return [];
    }
  }
}
