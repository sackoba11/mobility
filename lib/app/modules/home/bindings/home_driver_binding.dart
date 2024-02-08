import 'package:get/get.dart';

import '../controllers/home_user_controller.dart';

class HomeDriverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeDriverController>(
      () => HomeDriverController(),
    );
  }
}
