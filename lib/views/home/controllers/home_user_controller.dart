import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mobility/common/help_functions/help_functions.dart';

class HomeUserController extends GetxController {
  User? currentUser;
  late final RxBool isConnect = false.obs;

  @override
  void onInit() async {
    super.onInit();
    currentUser = FirebaseAuth.instance.currentUser;
    isConnect.value = await HelpFunctions.checkConnectivity();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
