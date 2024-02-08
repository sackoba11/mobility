import 'package:get/get.dart';

import '../controllers/home_bus_controller.dart';

class HomeBusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusController>(
      () => BusController(),
    );
  }
}
