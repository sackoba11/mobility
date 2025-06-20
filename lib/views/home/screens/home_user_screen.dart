import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobility/common/assets/assets.gen.dart';
import 'package:mobility/views/bus/screens/home_bus_screen.dart';
import 'package:mobility/data/repositories/authRepositiry/auth_repository_impl.dart';

import '../../../common/help_functions/help_functions.dart';
import '../../../common/widgets/body_wrapper.dart';
import '../../../utils/constants/app colors/app_colors.dart';
import '../../../utils/constants/typography/typography.dart';
import '../../otherCar/screens/home_other_car_screen.dart';
import '../../services/screens/services_screen.dart';
import '../../../common/widgets/custom_button_with_double_icons.dart';
import '../controllers/home_user_controller.dart';

class HomeUserScreen extends GetView<HomeUserController> {
  const HomeUserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeUserController());
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) =>
          HelpFunctions.onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
              margin: const EdgeInsets.only(left: 8),
              child: Obx(
                () {
                  return controller.isConnect.value == true
                      ? controller.currentUser?.photoURL != null
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(
                                  controller.currentUser!.photoURL!),
                            )
                          : CircleAvatar(
                              child: Text(
                                controller.currentUser!.displayName![0]
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            )
                      : CircleAvatar(
                          child: Text(
                            controller.currentUser!.displayName![0].toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                        );
                },
              )),
          actions: [
            IconButton(
                onPressed: () async {
                  await AuthRepositoryImpl()
                      .signOutFromGoogle()
                      .whenComplete(() => Get.offAll(const ServiceScreen()));
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                  size: 30,
                ))
          ],
        ),
        body: BodyWrapper(
          children: [
            AppTypography.regularBig(
                text:
                    "Bienvenue ${controller.currentUser!.displayName!.toUpperCase()}",
                color: AppColor.primary),
            const SizedBox(height: 10),
            AppTypography.lightSmall(
                text:
                    "Veuillez choisir le type  de transport pour votre voyage",
                color: AppColor.primary),
            const SizedBox(
              height: 130,
            ),
            CustomButtonWithDoubleIcons(
              icon: Assets.bus.svg(),
              title: "Bus",
              subtitle: "Sotra",
              onPressed: () {
                
                Get.to(const HomeBusScreen());
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButtonWithDoubleIcons(
              icon: Assets.bus.svg(),
              title: "Autre",
              subtitle: "Gbaka, Taxi",
              onPressed: () {
                Get.to(() => const HomeOtherCarScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
