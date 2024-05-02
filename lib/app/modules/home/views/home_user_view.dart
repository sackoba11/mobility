import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobility/app/assets/assets.gen.dart';
import 'package:mobility/app/modules/bus/views/home_bus.dart';
import 'package:mobility/app/repositories/authRepositiry/auth_repository_impl.dart';

import '../../../constants/app colors/app_colors.dart';
import '../../../constants/typography/typography.dart';
import '../../otherCar/views/home_other_car_view.dart';
import '../../services/controllers/services_controller.dart';
import '../../services/views/services_view.dart';
import '../../widgets/custom_button_without_ontap.dart';
import '../controllers/home_user_controller.dart';

class HomeUserView extends GetView<HomeUserController> {
  const HomeUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeUserController());
    return WillPopScope(
      onWillPop: () => ServicesController.onWillPop(context),
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
                      .whenComplete(() => Get.offAll(const ServicesView()));
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
                AppTypography().regularBig(
                    text:
                        "Bienvenue ${controller.currentUser!.displayName!.toUpperCase()} 👐",
                    color: AppColor.black),
                const SizedBox(
                  height: 20,
                ),
                AppTypography().regularDefault(
                    text:
                        "Veuillez choisir le type  de transport pour votre voyage",
                    color: AppColor.black),
                const SizedBox(
                  height: 130,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(const HomeBus());
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
                    Get.to(() => const HomeOtherCarView());
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
