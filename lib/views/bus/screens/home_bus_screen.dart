import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../utils/constants/app colors/app_colors.dart';
import '../controllers/home_bus_controller.dart';
import 'widgets/body_screen.dart';
import 'widgets/custom_sliver_appbar.dart';

class HomeBusScreen extends GetView<BusController> {
  const HomeBusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BusController());
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          showBackArrow: true,
          actions: [
            IconButton(
              iconSize: 26,
              icon: Icon(
                Icons.restart_alt,
                color: AppColor.white,
              ),
              onPressed: () async {
                await controller.getAllBus();
              },
            ),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                CustomSliverAppBar(),
              ];
            },
            body: SingleChildScrollView(
              child: BodyScreen(),
            )));
  }
}
