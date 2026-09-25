import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/app_button.dart';
import '../../../common/widgets/state_views.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../routes/app_pages.dart';
import '../../shell/controllers/shell_controller.dart';
import '../controllers/service_tab_controller.dart';

/// Onglet Service chauffeur (Phase shell) : suit le service en cours
/// même après fermeture de l'app (session persistée).
class DriverServiceScreen extends GetView<ServiceTabController> {
  const DriverServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ServiceTabController>()) {
      Get.put(ServiceTabController());
    }
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Mon service')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const AppLoadingView(message: 'Chargement du service...');
        }
        if (!controller.hasService) {
          return AppEmptyView(
            icon: Icons.radio_button_checked_outlined,
            title: 'Aucun service en cours',
            subtitle: 'Choisissez un bus pour le mettre en service.',
            actionLabel: 'Voir les bus',
            onAction: () => Get.find<ShellController>().setTab(0),
          );
        }
        final bus = controller.bus.value;
        return RefreshIndicator(
          onRefresh: controller.load,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    StatusBadge.active(context, label: 'En ligne'),
                    const SizedBox(width: 8),
                    Text('Bus ${controller.busNumber.value}',
                        style: theme.textTheme.titleLarge),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  bus != null
                      ? '${bus.source} ↔ ${bus.destination}'
                      : 'Positions partagées toutes les 15 secondes.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 16),
                if (bus != null)
                  AppButton(
                    title: 'Ouvrir la fiche du bus',
                    variant: AppButtonVariant.outline,
                    onPressed: () => Get.toNamed(Paths.driver,
                        arguments: bus),
                  ),
                const SizedBox(height: 12),
                AppButton(
                  title: 'Arrêter le service',
                  variant: AppButtonVariant.danger,
                  onPressed: () => _confirmStop(context),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Future<void> _confirmStop(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Get.defaultDialog(
      title: 'Arrêter le service',
      middleText:
          'Le bus ne sera plus visible par les passagers. Continuer ?',
      textCancel: 'Annuler',
      textConfirm: 'Arrêter',
      confirmTextColor: Colors.white,
      buttonColor: scheme.error,
      onConfirm: () async {
        Get.back();
        await controller.stopService();
      },
    );
  }
}
