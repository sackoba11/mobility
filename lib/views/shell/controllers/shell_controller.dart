import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../driver/controllers/service_tab_controller.dart';
import '../../home/controllers/home_driver_controller.dart';

/// Rôle dans le shell (choix des onglets).
enum ShellRole { passenger, driver }

/// Config d'un onglet : écran + destination de navigation.
class ShellTab {
  final Widget page;
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const ShellTab({
    required this.page,
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

/// Contrôleur du shell à onglets (IndexedStack = état conservé par onglet).
class ShellController extends GetxController {
  final RxInt tabIndex = 0.obs;
  late final ShellRole role;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    final raw = args is Map ? args['role']?.toString() : null;
    role = raw == 'driver' ? ShellRole.driver : ShellRole.passenger;
  }

  void setTab(int index) {
    tabIndex.value = index;
    // L'IndexedStack conserve l'état des onglets : rafraîchir les données
    // volatiles à la sélection (session lue après une activation ailleurs).
    if (role == ShellRole.driver) {
      if (index == 2 && Get.isRegistered<ServiceTabController>()) {
        Get.find<ServiceTabController>().load();
      }
      if (index == 0 && Get.isRegistered<HomeDriverController>()) {
        Get.find<HomeDriverController>().update();
      }
    }
  }
}
