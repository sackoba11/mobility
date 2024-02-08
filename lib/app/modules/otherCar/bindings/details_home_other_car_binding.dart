import 'package:get/get.dart';

import '../controllers/details_home_other_car_controller.dart';

class DetailsHomeOtherCarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetilsHomeOtherCarController>(
      () => DetilsHomeOtherCarController(),
    );
  }
}
