import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility/common/assets/assets.gen.dart';
import 'package:mobility/data/repositories/authRepositiry/auth_repository_impl.dart';

import '../../../common/help_functions/help_functions.dart';
import '../../../common/widgets/body_wrapper.dart';
import '../../../common/widgets/custom_button_with_double_icons.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constants/app colors/app_colors.dart';
import '../../../utils/constants/typography/typography.dart';
import '../controllers/home_user_controller.dart';

class HomeUserScreen extends GetView<HomeUserController> {
  const HomeUserScreen({super.key});

  String _userInitial() {
    final displayName = controller.currentUser?.displayName?.trim();
    if (displayName != null && displayName.isNotEmpty) {
      return displayName[0].toUpperCase();
    }
    final email = controller.currentUser?.email?.trim();
    if (email != null && email.isNotEmpty) {
      return email[0].toUpperCase();
    }
    return "?";
  }

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<HomeUserController>()) {
      Get.put(HomeUserController());
    }
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) =>
          HelpFunctions.onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            margin: const EdgeInsets.only(left: 8),
            child: Obx(() {
              final photoUrl = controller.currentUser?.photoURL;
              if (photoUrl != null && photoUrl.isNotEmpty) {
                return CircleAvatar(
                  backgroundImage: NetworkImage(photoUrl),
                );
              }
              return CircleAvatar(
                child: Text(
                  _userInitial(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              );
            }),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await AuthRepositoryImpl().signOutFromGoogle().whenComplete(
                  () => Get.offAllNamed(Paths.services),
                );
              },
              icon: const Icon(Icons.logout, color: Colors.black, size: 30),
            ),
          ],
        ),
        body: BodyWrapper(
          children: [
            AppTypography.regularBig(
              text:
                  "Bienvenue ${(controller.currentUser?.displayName ?? "").toUpperCase()}",
              color: AppColor.primary,
            ),
            const SizedBox(height: 10),
            AppTypography.lightSmall(
              text: "Veuillez choisir le type  de transport pour votre voyage",
              color: AppColor.primary,
            ),
            const SizedBox(height: 130),
            CustomButtonWithDoubleIcons(
              icon: Assets.bus.svg(),
              title: "Bus",
              subtitle: "Sotra",
              onPressed: () {
                Get.toNamed(Paths.homeBus);
              },
            ),
            const SizedBox(height: 10),
            CustomButtonWithDoubleIcons(
              icon: Assets.bus.svg(),
              title: "Autre",
              subtitle: "Gbaka, Taxi",
              onPressed: () {
                Get.toNamed(Paths.homeOtherCar);
              },
            ),
          ],
        ),
      ),
    );
  }
}
