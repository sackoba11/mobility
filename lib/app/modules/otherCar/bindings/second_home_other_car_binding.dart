import 'package:get/get.dart';

import '../controllers/other_car_controller.dart';

class OtherCarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtherCarController>(
      () => OtherCarController(),
    );
  }
}
