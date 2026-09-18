import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobility/common/assets/assets.gen.dart';

import '../../../common/widgets/app_button.dart';
import '../../../common/widgets/map_sheet.dart';
import '../../../common/widgets/transport_cards.dart';
import '../../../models/bus/bus_from_firestore/bus.dart';
import '../controllers/driver_controller.dart';

/// Mise en service d'un bus (Phase 4) : activation + diffusion position.
class DriverScreen extends GetView<DriverController> {
  final Bus? busSelected;
  const DriverScreen({super.key, this.busSelected});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<DriverController>()) {
      Get.put(DriverController());
    }
    final args = Get.arguments;
    final Bus? busFromArgs = args is Bus ? args : null;
    final bus = busSelected ?? busFromArgs;
    if (bus == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Chauffeur")),
        body: const Center(child: Text("Aucun bus sélectionné.")),
      );
    }
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) =>
          _onWillPop(context, controller.isActive.value),
      child: Scaffold(
        body: Stack(
          children: [
            Obx(() => GoogleMap(
                  onMapCreated: controller.onMapCreated,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  tiltGesturesEnabled: true,
                  compassEnabled: false,
                  scrollGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(
                        double.tryParse(
                                controller.userLatitude.value) ??
                            5.3502292,
                        double.tryParse(
                                controller.userLongitude.value) ??
                            -3.9881887,
                      ),
                      zoom: 15),
                  markers: {
                    Marker(
                      markerId: const MarkerId("UserPosition"),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueAzure),
                      position: LatLng(
                          double.tryParse(
                                  controller.userLatitude.value) ??
                              5.3502292,
                          double.tryParse(
                                  controller.userLongitude.value) ??
                              -3.9881887),
                    ),
                  },
                )),
            MapSheet(
              initialSize: 0.42,
              minSize: 0.3,
              child: _ServicePanel(bus: bus),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onWillPop(BuildContext context, bool isActive) async {
    if (!isActive) {
      Get.back();
      return;
    }
    await Get.defaultDialog(
      title: "Service en cours",
      middleText:
          "Veuillez arrêter le service avant de revenir en arrière.",
      textConfirm: "Compris",
      confirmTextColor: Colors.white,
      buttonColor: Theme.of(context).colorScheme.primary,
      onConfirm: () => Get.back(),
    );
  }
}

class _ServicePanel extends GetView<DriverController> {
  final Bus bus;
  const _ServicePanel({required this.bus});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Assets.vector3.image(width: 56, height: 56),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Bus ${bus.number}",
                          style: theme.textTheme.titleLarge),
                      const SizedBox(width: 8),
                      Obx(() => controller.isActive.value
                          ? StatusBadge.active(context,
                              label: "En ligne")
                          : StatusBadge.line(
                              context, "Hors service")),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text("${bus.source} ↔ ${bus.destination}",
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color: scheme.onSurfaceVariant)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: scheme.secondaryContainer.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            "Votre position est partagée avec les passagers toutes les 15 secondes pendant le service.",
            style: theme.textTheme.bodySmall?.copyWith(
                color: scheme.onSecondaryContainer),
          ),
        ),
        const SizedBox(height: 16),
        Obx(() => AppButton(
              title: controller.isActive.value
                  ? "Arrêter le service"
                  : "Mettre en service",
              variant: controller.isActive.value
                  ? AppButtonVariant.danger
                  : AppButtonVariant.primary,
              onPressed: () => _toggleService(),
            )),
      ],
    );
  }

  Future<void> _toggleService() async {
    if (!controller.isActive.value) {
      controller.isActive.value = true;
      controller.idBusController.value =
          await controller.activeBusService(
              bus, controller.positionBus.value);

      controller.serviceTimer?.cancel();
      controller.serviceTimer =
          Timer.periodic(const Duration(seconds: 15), (timer) async {
        if (controller.isActive.value) {
          final lat =
              double.tryParse(controller.userLatitude.value);
          final lng =
              double.tryParse(controller.userLongitude.value);
          if (lat == null || lng == null) return;
          controller.updateBusService(bus.number,
              controller.idBusController.value, lat, lng);
        } else {
          timer.cancel();
        }
      });
    } else {
      controller.isActive.value = false;
      controller.serviceTimer?.cancel();
      await controller.deactiveBusService(
          bus.number, controller.idBusController.value);
    }
  }
}
