import 'package:get/get.dart';

import '../views/bus/screens/details_home_bus_screen.dart';
import '../views/bus/screens/home_bus_screen.dart';
import '../views/bus/screens/second_home_bus_screen.dart';
import '../views/driver/screens/driver_screen.dart';
import '../views/otherCar/screens/details_home_other_car_screen.dart';
import '../views/otherCar/screens/home_other_car_screen.dart';
import '../views/otherCar/screens/second_home_other_car_screen.dart';
import '../views/profile/screens/profile_screen.dart';
import '../views/services/screens/services_screen.dart';
import '../views/shell/screens/shell_screen.dart';
import '../views/splash_screen/screens/splash_screen.dart';
import '../views/unknown_page/unknown_page.dart';
import 'app_bindings.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Paths.splashScreen;

  static final routes = [
    // unkownRoute
    GetPage(name: Paths.unknownRoute, page: () => const UnknownPage()),
    // Shell à onglets (passager / chauffeur selon arguments role).
    // Tous les controllers des onglets via AppBindings.shell().
    GetPage(
      name: Paths.shell,
      page: () => const ShellScreen(),
      binding: AppBindings.shell(),
    ),

// Driver Pages
    GetPage(
      name: Paths.driver,
      page: () => const DriverScreen(),
      binding: AppBindings.driver(),
    ),

    // Services Pages
    GetPage(
      name: Paths.services,
      page: () => const ServiceScreen(),
      binding: AppBindings.services(),
    ),

    //Profile Pages
    GetPage(
      name: Paths.profile,
      page: () => const ProfileScreen(),
      binding: AppBindings.tabs(),
    ),

    // SplashScreen Pages
    GetPage(
      name: Paths.splashScreen,
      page: () => const SplashScreen(),
      binding: AppBindings.splash(),
    ),

    // Bus Pages — même instance partagée que l'onglet (fenix).
    GetPage(
      name: Paths.homeBus,
      page: () => const HomeBusScreen(),
      binding: AppBindings.tabs(),
    ),
    GetPage(
      name: Paths.secondHomeBus,
      page: () => const SecondHomeBusScreen(),
    ),
    GetPage(
      name: Paths.detailHomeBus,
      page: () => const DetailsHomeBusScreen(),
    ),
    // Other Car Pages — même instance partagée que l'onglet (fenix).
    GetPage(
      name: Paths.homeOtherCar,
      page: () => const HomeOtherCarScreen(),
      binding: AppBindings.tabs(),
    ),
    GetPage(
      name: Paths.secondOtherCar,
      page: () => const SecondHomeOtherCarScreen(),
    ),
    GetPage(
      name: Paths.detailOtherCar,
      page: () => const DetailsHomeOtherCarScreen(),
    ),
  ];
}
