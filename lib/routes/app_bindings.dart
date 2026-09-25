import 'package:get/get.dart';

import '../views/bus/controllers/home_bus_controller.dart';
import '../views/driver/controllers/driver_controller.dart';
import '../views/driver/controllers/service_tab_controller.dart';
import '../views/home/controllers/home_driver_controller.dart';
import '../views/home/controllers/home_user_controller.dart';
import '../views/otherCar/controllers/other_car_controller.dart';
import '../views/profile/controllers/profile_controller.dart';
import '../views/services/controllers/services_controller.dart';
import '../views/shell/controllers/shell_controller.dart';
import '../views/splash_screen/controllers/splash_screen_controller.dart';

/// Bindings centralisés (tous en lazyPut fenix : recréés à la demande,
/// partagés entre onglets et sous-écrans).
abstract class AppBindings {
  /// Controllers des onglets (partagés shell <-> sous-écrans).
  /// ServiceTabController est PERMANENT : source réactive unique de l'état
  /// du service, observée en Obx par tous les écrans chauffeur.
  static BindingsBuilder tabs() => BindingsBuilder(() {
        Get.lazyPut<HomeUserController>(() => HomeUserController(),
            fenix: true);
        Get.lazyPut<HomeDriverController>(() => HomeDriverController(),
            fenix: true);
        Get.lazyPut<BusController>(() => BusController(), fenix: true);
        Get.lazyPut<OtherCarController>(() => OtherCarController(),
            fenix: true);
        if (!Get.isRegistered<ServiceTabController>()) {
          Get.put(ServiceTabController(), permanent: true);
        }
        Get.lazyPut<ProfileController>(() => ProfileController(),
            fenix: true);
      });

  /// Shell : controller du shell + controllers des onglets.
  static BindingsBuilder shell() => BindingsBuilder(() {
        Get.lazyPut<ShellController>(() => ShellController());
        tabs().builder();
      });

  /// Écrans hors shell (connexion, splash, fiche chauffeur).
  static BindingsBuilder splash() => BindingsBuilder(() {
        Get.lazyPut<SplashScreenController>(
            () => SplashScreenController());
      });

  static BindingsBuilder services() => BindingsBuilder(() {
        Get.lazyPut<ServicesController>(() => ServicesController());
      });

  static BindingsBuilder driver() => BindingsBuilder(() {
        Get.lazyPut<DriverController>(() => DriverController());
      });
}
