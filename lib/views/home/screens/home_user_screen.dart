import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobility/common/assets/assets.gen.dart';
import 'package:mobility/views/bus/screens/home_bus_screen.dart';
import 'package:mobility/data/repositories/authRepositiry/auth_repository_impl.dart';

import '../../../utils/constants/app colors/app_colors.dart';
import '../../../utils/constants/typography/typography.dart';
import '../../../utils/helpers/helpers.dart';
import '../../otherCar/screens/home_other_car_screen.dart';
import '../../services/screens/services_screen.dart';
import '../../../common/widgets/custom_button_without_ontap.dart';
import '../controllers/home_user_controller.dart';

class HomeUserScreen extends GetView<HomeUserController> {
  const HomeUserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeUserController());
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => Helpers.onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Container(
              margin: const EdgeInsets.only(left: 8),
              child: controller.currentUser?.photoURL != null
                  ? CircleAvatar(
                      backgroundImage:
                          NetworkImage(controller.currentUser!.photoURL!),
                    )
                  : CircleAvatar(
                      child: Text(
                        controller.currentUser!.displayName![0].toString(),
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
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
          backgroundColor: AppColor.background,
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTypography.regularBig(
                    text:
                        "Bienvenue ${controller.currentUser!.displayName!.toUpperCase()} 👐",
                    color: AppColor.primary),
                const SizedBox(
                  height: 20,
                ),
                AppTypography.regularDefault(
                    text:
                        "Veuillez choisir le type  de transport pour votre voyage",
                    color: AppColor.primary),
                const SizedBox(
                  height: 130,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(const HomeBusScreen());
                  },
                  child: CustomButtonWithoutOnTap(
                    icon: Assets.bus.svg(),
                    title: "Bus",
                    subtitle: "Sotra",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const HomeOtherCarScreen());
                  },
                  child: CustomButtonWithoutOnTap(
                    icon: Assets.bus.svg(),
                    title: "Autre",
                    subtitle: "Gbaka, Taxi",
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
