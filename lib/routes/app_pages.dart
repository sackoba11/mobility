import 'package:get/get.dart';

import '../views/bus/bindings/home_bus_binding.dart';
import '../views/bus/screens/details_home_bus_screen.dart';
import '../views/bus/screens/home_bus_screen.dart';
import '../views/bus/screens/second_home_bus_screen.dart';
import '../views/driver/bindings/driver_binding.dart';
import '../views/driver/screens/driver_screen.dart';
import '../views/home/bindings/home_driver_binding.dart';
import '../views/home/bindings/home_user_binding.dart';
import '../views/home/screens/home_driver_screen.dart';
import '../views/home/screens/home_user_screen.dart';
import '../views/otherCar/bindings/second_home_other_car_binding.dart';
import '../views/otherCar/screens/details_home_other_car_screen.dart';
import '../views/otherCar/screens/home_other_car_screen.dart';
import '../views/otherCar/screens/second_home_other_car_screen.dart';
import '../views/profile/bindings/profile_binding.dart';
import '../views/profile/screens/profile_screen.dart';
import '../views/services/bindings/services_binding.dart';
import '../views/services/screens/services_screen.dart';
import '../views/splash_screen/bindings/splash_screen_binding.dart';
import '../views/splash_screen/screens/splash_screen.dart';
import '../views/unknown_page/unknown_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splashScreen;

  static final routes = [
    // unkownRoute
    GetPage(name: _Paths.unknownRoute, page: () => const UnknownPage()),
    //Home Pages
    GetPage(
      name: _Paths.homeUser,
      page: () => const HomeUserScreen(),
      binding: HomeUserBinding(),
    ),
    GetPage(
      name: _Paths.homeDriver,
      page: () => const HomeDriverScreen(),
      binding: HomeDriverBinding(),
    ),

// Driver Pages
    GetPage(
      name: _Paths.driver,
      page: () => const DriverScreen(),
      binding: DriverBinding(),
    ),

    // Services Pages
    GetPage(
      name: _Paths.services,
      page: () => const ServiceScreen(),
      binding: ServicesBinding(),
    ),

    //Profile Pages
    GetPage(
      name: _Paths.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),

    // SplashScreen Pages
    GetPage(
      name: _Paths.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),

    // Bus Pages
    GetPage(
      name: _Paths.homeBus,
      page: () => const HomeBusScreen(),
      binding: HomeBusBinding(),
    ),
    GetPage(
      name: _Paths.secondHomeBus,
      page: () => const SecondHomeBusScreen(),
      binding: HomeBusBinding(),
    ),
    GetPage(
      name: _Paths.detailHomeBus,
      page: () => const DetailsHomeBusScreen(),
      binding: HomeBusBinding(),
    ),
    // Other Car Pages
    GetPage(
      name: _Paths.homeOtherCar,
      page: () => const HomeOtherCarScreen(),
      binding: OtherCarBinding(),
    ),
    GetPage(
      name: _Paths.secondOtherCar,
      page: () => const SecondHomeOtherCarScreen(),
      binding: OtherCarBinding(),
    ),
    GetPage(
      name: _Paths.detailOtherCar,
      page: () => const DetailsHomeOtherCarScreen(),
      binding: OtherCarBinding(),
    ),
  ];
}
