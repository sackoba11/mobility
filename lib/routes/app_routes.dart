part of 'app_pages.dart';

abstract class Paths {
  Paths._();
// UnknownRoute
  static const unknownRoute = "/unknownRoute";
  // Home
  static const homeUser = '/homeUser';
  static const homeDriver = '/homeDriver';

  //Driver home
  static const driver = '/driver';

  // User home
  static const user = '/user';

  // Services home
  static const services = '/services';

  // User Profile
  static const profile = '/profile';

  //SplashScreen
  static const splashScreen = '/splashscreen';

  // Bus Home
  static const homeBus = '/bus';
  static const secondHomeBus = "/bus/secondHomeBus";
  static const detailHomeBus = "/bus/secondHomeBus/detailHomeBus";

//Other Car
  static const homeOtherCar = '/homeOtherCar';
  static const secondOtherCar = '/secondOtherCar';
  static const detailOtherCar = '/detailOtherCar';
}
