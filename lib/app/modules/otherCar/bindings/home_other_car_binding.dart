import 'package:get/get.dart';

import '../controllers/home_other_car_controller.dart';

class HomeOtherCarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeOtherCarController>(
      () => HomeOtherCarController(),
    );
  }
}
