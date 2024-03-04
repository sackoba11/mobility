import 'package:get/get.dart';
import 'package:mobility/app/modules/bus/bindings/home_bus_binding.dart';
import 'package:mobility/app/modules/bus/views/details_home_bus.dart';
import 'package:mobility/app/modules/bus/views/home_bus.dart';
import 'package:mobility/app/modules/bus/views/second_home_bus.dart';
import 'package:mobility/app/modules/home/bindings/home_driver_binding.dart';
import 'package:mobility/app/modules/home/views/home_driver_view.dart';
import 'package:mobility/app/modules/otherCar/bindings/second_home_other_car_binding.dart';
import 'package:mobility/app/modules/otherCar/views/details_home_other_car_view.dart';
import 'package:mobility/app/modules/otherCar/views/home_other_car_view.dart';
import 'package:mobility/app/modules/otherCar/views/second_home_other_car_view.dart';

import '../modules/driver/bindings/driver_binding.dart';
import '../modules/driver/views/driver_view.dart';
import '../modules/home/bindings/home_user_binding.dart';
import '../modules/home/views/home_user_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/services/bindings/services_binding.dart';
import '../modules/services/views/services_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/unknown_page/unknown_page.dart';
import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/user_view.dart';

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
      page: () => const HomeUserView(),
      binding: HomeUserBinding(),
    ),
    GetPage(
      name: _Paths.homeDriver,
      page: () => const HomeDriverView(),
      binding: HomeDriverBinding(),
    ),

// Driver Pages
    GetPage(
      name: _Paths.driver,
      page: () => const DriverView(),
      binding: DriverBinding(),
    ),

    // User Pages
    GetPage(
      name: _Paths.user,
      page: () => const UserView(),
      binding: UserBinding(),
    ),

    // Services Pages
    GetPage(
      name: _Paths.services,
      page: () => const ServicesView(),
      binding: ServicesBinding(),
    ),

    //Profile Pages
    GetPage(
      name: _Paths.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),

    // SplashScreen Pages
    GetPage(
      name: _Paths.splashScreen,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),

    // Bus Pages
    GetPage(
      name: _Paths.homeBus,
      page: () => const HomeBus(),
      binding: HomeBusBinding(),
    ),
    GetPage(
      name: _Paths.secondHomeBus,
      page: () => const SecondHomeBus(),
      binding: HomeBusBinding(),
    ),
    GetPage(
      name: _Paths.detailHomeBus,
      page: () => const DetailsHomeBus(),
      binding: HomeBusBinding(),
    ),
    // Other Car Pages
    GetPage(
      name: _Paths.homeOtherCar,
      page: () => const HomeOtherCarView(),
      binding: OtherCarBinding(),
    ),
    GetPage(
      name: _Paths.secondOtherCar,
      page: () => const SecondHomeOtherCarView(),
      binding: OtherCarBinding(),
    ),
    GetPage(
      name: _Paths.detailOtherCar,
      page: () => const DetailsHomeOtherCarView(),
      binding: OtherCarBinding(),
    ),
  ];
}
