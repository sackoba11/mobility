import 'package:get/get.dart';
import 'package:mobility/data/repositories/driverRepository/driver_repository_impl.dart';
import 'package:mobility/data/repositories/driverRepository/i_driver_repository.dart';
import 'package:mobility/models/bus/bus_from_firestore/bus.dart';
import 'package:mobility/services/driver_tracking/driver_session_store.dart';
import 'package:mobility/services/driver_tracking/driver_tracking_service.dart';

/// Onglet Service chauffeur : état du service en cours + actions.
/// Lit la session persistée (robuste à la fermeture de l'app).
/// Enregistré en PERMANENT : c'est la source réactive unique — chaque
/// mutation (activation/arrêt/restauration) notifie instantanément tous
/// les écrans (liste bus, fiche, onglet Service).
class ServiceTabController extends GetxController {
  IDriverRepository repository = DriverRepositoryImpl();
  final RxBool isLoading = true.obs;
  final Rxn<Bus> bus = Rxn<Bus>();
  final RxInt busNumber = (-1).obs;
  final RxString idBus = ''.obs;
  final RxString lastError = ''.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  /// Synchro légère (sans réseau) depuis la session persistée.
  /// Appelée par DriverController après chaque mutation.
  void syncFromSession() {
    final session = DriverSessionStore.read();
    final number = session?['busNumber'];
    final id = session?['idBus']?.toString() ?? '';
    if (number is! int || id.isEmpty) {
      busNumber.value = -1;
      idBus.value = '';
    } else {
      busNumber.value = number;
      idBus.value = id;
    }
  }

  Future<void> load() async {
    isLoading.value = true;
    lastError.value = '';
    syncFromSession();
    if (!hasService) {
      bus.value = null;
      isLoading.value = false;
      return;
    }
    final number = busNumber.value;
    final result = await repository.getAllBus();
    result.fold(
      (l) => lastError.value = l.userMessage,
      (list) {
        try {
          bus.value = list.firstWhere((b) => b.number == number);
        } catch (_) {
          bus.value = null;
        }
      },
    );
    isLoading.value = false;
  }

  bool get hasService => busNumber.value != -1;

  Future<void> stopService() async {
    final number = busNumber.value;
    final id = idBus.value;
    if (number != -1 && id.isNotEmpty) {
      await repository.deactivateBusService(busNumber: number, idBus: id);
    }
    await DriverTrackingService.stop();
    await DriverTrackingService.clearSession();
    await DriverSessionStore.clear();
    await load();
  }
}
