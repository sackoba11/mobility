import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/help_functions/help_functions.dart';
import '../../bus/screens/home_bus_screen.dart';
import '../../driver/screens/driver_service_screen.dart';
import '../../home/screens/home_driver_screen.dart';
import '../../otherCar/screens/home_other_car_screen.dart';
import '../../profile/screens/profile_screen.dart';
import '../passenger/screens/passenger_dashboard_screen.dart';
import '../controllers/shell_controller.dart';

/// Coquille à onglets (Phase shell) : remplace les pages plates
/// HomeUser/HomeDriver. Les sous-flows (détails, trajets) s'empilent
/// par-dessus en routes nommées, l'état des onglets est conservé.
class ShellScreen extends GetView<ShellController> {
  const ShellScreen({super.key});

  List<ShellTab> _tabs(ShellRole role) {
    if (role == ShellRole.driver) {
      return const [
        ShellTab(
          page: HomeDriverScreen(),
          icon: Icons.directions_bus_outlined,
          activeIcon: Icons.directions_bus,
          label: 'Bus',
        ),
        ShellTab(
          page: DriverServiceScreen(),
          icon: Icons.radio_button_checked_outlined,
          activeIcon: Icons.radio_button_checked,
          label: 'Service',
        ),
        ShellTab(
          page: ProfileScreen(),
          icon: Icons.person_outline,
          activeIcon: Icons.person,
          label: 'Profil',
        ),
      ];
    }
    return const [
      ShellTab(
        page: PassengerDashboardScreen(),
        icon: Icons.home_outlined,
        activeIcon: Icons.home,
        label: 'Accueil',
      ),
      ShellTab(
        page: HomeBusScreen(),
        icon: Icons.directions_bus_outlined,
        activeIcon: Icons.directions_bus,
        label: 'Bus',
      ),
      ShellTab(
        page: HomeOtherCarScreen(),
        icon: Icons.local_taxi_outlined,
        activeIcon: Icons.local_taxi,
        label: 'Gares',
      ),
      ShellTab(
        page: ProfileScreen(),
        icon: Icons.person_outline,
        activeIcon: Icons.person,
        label: 'Profil',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final tabs = _tabs(controller.role);
    return PopScope(
      canPop: false,
      // Déclenché uniquement quand le shell est au sommet (les sous-écrans
      // poussés par-dessus se dépilent normalement avant).
      // Sur un onglet autre que l'accueil : retour à l'accueil d'abord.
      // Sur l'accueil : demande de quitter l'app.
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (controller.tabIndex.value != 0) {
          controller.setTab(0);
        } else {
          HelpFunctions.onWillPop(context);
        }
      },
      child: Obx(() => Scaffold(
            body: IndexedStack(
              index: controller.tabIndex.value.clamp(0, tabs.length - 1),
              children: [for (final t in tabs) t.page],
            ),
            bottomNavigationBar: NavigationBar(
              selectedIndex:
                  controller.tabIndex.value.clamp(0, tabs.length - 1),
              onDestinationSelected: controller.setTab,
              destinations: [
                for (final t in tabs)
                  NavigationDestination(
                    icon: Icon(t.icon),
                    selectedIcon: Icon(t.activeIcon),
                    label: t.label,
                  ),
              ],
            ),
          )),
    );
  }
}
