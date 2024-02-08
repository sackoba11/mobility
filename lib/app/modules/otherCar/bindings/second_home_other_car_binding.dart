import 'package:get/get.dart';

import '../controllers/second_home_other_car_controller.dart';

class SecondHomeOtherCarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecondHomeOtherCarController>(
      () => SecondHomeOtherCarController(),
    );
  }
}
