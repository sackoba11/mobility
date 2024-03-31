import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobility/app/assets/assets.gen.dart';

import '../../../constants/app colors/app_colors.dart';
import '../../../constants/app string/app_string.dart';
import '../../../constants/typography/typography.dart';
import '../../widgets/apps_methodes.dart';
import '../../widgets/custom_button_without_ontap.dart';
import '../controllers/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  const ServicesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final typo = AppTypography();
    Get.put(ServicesController());
    return WillPopScope(
      onWillPop: () => ServicesController.onWillPop(context),
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
