import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeUserController extends GetxController {
  User? currentUser;

  @override
  void onInit() {
    super.onInit();
    currentUser = FirebaseAuth.instance.currentUser;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
