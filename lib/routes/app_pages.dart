import 'package:get/get.dart';

import '../views/bus/controllers/home_bus_controller.dart';
import '../views/bus/screens/details_home_bus_screen.dart';
import '../views/bus/screens/home_bus_screen.dart';
import '../views/bus/screens/second_home_bus_screen.dart';
import '../views/driver/controllers/driver_controller.dart';
import '../views/driver/screens/driver_screen.dart';
import '../views/home/controllers/home_driver_controller.dart';
import '../views/home/controllers/home_user_controller.dart';
import '../views/home/screens/home_driver_screen.dart';
import '../views/home/screens/home_user_screen.dart';
import '../views/otherCar/controllers/other_car_controller.dart';
import '../views/otherCar/screens/details_home_other_car_screen.dart';
import '../views/otherCar/screens/home_other_car_screen.dart';
import '../views/otherCar/screens/second_home_other_car_screen.dart';
import '../views/profile/controllers/profile_controller.dart';
import '../views/profile/screens/profile_screen.dart';
import '../views/services/controllers/services_controller.dart';
import '../views/services/screens/services_screen.dart';
import '../views/splash_screen/controllers/splash_screen_controller.dart';
import '../views/splash_screen/screens/splash_screen.dart';
import '../views/unknown_page/unknown_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Paths.splashScreen;

  static final routes = [
    // unkownRoute
    GetPage(name: Paths.unknownRoute, page: () => const UnknownPage()),
    //Home Pages
    GetPage(
      name: Paths.homeUser,
      page: () => const HomeUserScreen(),
      binding: BindingsBuilder(
          () => Get.lazyPut<HomeUserController>(() => HomeUserController())),
    ),
    GetPage(
      name: Paths.homeDriver,
      page: () => const HomeDriverScreen(),
      binding: BindingsBuilder(() =>
          Get.lazyPut<HomeDriverController>(() => HomeDriverController())),
    ),

// Driver Pages
    GetPage(
      name: Paths.driver,
      page: () => const DriverScreen(),
      binding: BindingsBuilder(
          () => Get.lazyPut<DriverController>(() => DriverController())),
    ),

    // Services Pages
    GetPage(
      name: Paths.services,
      page: () => const ServiceScreen(),
      binding: BindingsBuilder(
          () => Get.lazyPut<ServicesController>(() => ServicesController())),
    ),

    //Profile Pages
    GetPage(
      name: Paths.profile,
      page: () => const ProfileScreen(),
      binding: BindingsBuilder(
          () => Get.lazyPut<ProfileController>(() => ProfileController())),
    ),

    // SplashScreen Pages
    GetPage(
      name: Paths.splashScreen,
      page: () => const SplashScreen(),
      binding: BindingsBuilder(() =>
          Get.lazyPut<SplashScreenController>(() => SplashScreenController())),
    ),

    // Bus Pages
    GetPage(
      name: Paths.homeBus,
      page: () => const HomeBusScreen(),
      binding: BindingsBuilder(
          () => Get.lazyPut<BusController>(() => BusController())),
    ),
    GetPage(
      name: Paths.secondHomeBus,
      page: () => const SecondHomeBusScreen(),
      binding: BindingsBuilder(
          () => Get.lazyPut<BusController>(() => BusController())),
    ),
    GetPage(
      name: Paths.detailHomeBus,
      page: () => const DetailsHomeBusScreen(),
      binding: BindingsBuilder(
          () => Get.lazyPut<BusController>(() => BusController())),
    ),
    // Other Car Pages
    GetPage(
      name: Paths.homeOtherCar,
      page: () => const HomeOtherCarScreen(),
      binding: BindingsBuilder(
          () => Get.lazyPut<OtherCarController>(() => OtherCarController())),
    ),
    GetPage(
      name: Paths.secondOtherCar,
      page: () => const SecondHomeOtherCarScreen(),
      binding: BindingsBuilder(
          () => Get.lazyPut<OtherCarController>(() => OtherCarController())),
    ),
    GetPage(
      name: Paths.detailOtherCar,
      page: () => const DetailsHomeOtherCarScreen(),
      binding: BindingsBuilder(
          () => Get.lazyPut<OtherCarController>(() => OtherCarController())),
    ),
  ];
}
