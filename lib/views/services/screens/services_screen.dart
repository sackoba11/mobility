import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobility/common/assets/assets.gen.dart';

import '../../../utils/constants/app colors/app_colors.dart';
import '../../../utils/constants/app string/app_string.dart';
import '../../../utils/constants/typography/typography.dart';
import '../../../common/widgets/apps_methodes.dart';
import '../../../common/widgets/custom_button_without_ontap.dart';
import '../controllers/services_controller.dart';

class ServiceScreen extends GetView<ServicesController> {
  const ServiceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final typo = AppTypography();
    Get.put(ServicesController());
    return PopScope(
      canPop: false,
      onPopInvokedWithResult:(didPop, result) => ServicesController.onWillPop(context),
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 20,
              ),
              typo.regularBig(text: AppString.hey),
              const SizedBox(
                height: 15,
              ),
              typo.lightSmall(text: AppString.authSubTitle),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 100,
              ),
              TextButton(
                onPressed: () => showGoogleLoginSHeet(context),
                child: CustomButtonWithoutOnTap(
                  icon: Assets.passenger.svg(),
                  title: AppString.passenger,
                  subtitle: AppString.trackyoucar,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: () => showDriverLogin(context),
                child: CustomButtonWithoutOnTap(
                  icon: Assets.driver.svg(),
                  title: AppString.driver,
                  subtitle: AppString.shareyourposition,
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
