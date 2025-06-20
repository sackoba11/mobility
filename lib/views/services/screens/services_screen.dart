import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobility/common/assets/assets.gen.dart';

import '../../../common/help_functions/help_functions.dart';
import '../../../common/widgets/body_wrapper.dart';
import '../../../common/widgets/widget.bottomSheet/bottom_sheet_driver.dart';
import '../../../common/widgets/widget.bottomSheet/bottom_sheet_user.dart';
import '../../../utils/constants/app colors/app_colors.dart';
import '../../../utils/constants/app string/app_string.dart';
import '../../../utils/constants/typography/typography.dart';
import '../../../common/widgets/custom_button_with_double_icons.dart';
import '../controllers/services_controller.dart';

class ServiceScreen extends GetView<ServicesController> {
  const ServiceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: BodyWrapper(
        children: [
          AppTypography.regularBig(text: AppString.hey),
          const SizedBox(
            height: 15,
          ),
          AppTypography.lightSmall(text: AppString.descriptionService),
          const SizedBox(
            height: 115,
          ),
          CustomButtonWithDoubleIcons(
            icon: Assets.passenger.svg(),
            title: AppString.passenger,
            subtitle: AppString.searchService,
            onPressed: () => HelpFunctions.customModalSheet(
                context: context, child: BottomSheetUser()),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomButtonWithDoubleIcons(
            icon: Assets.driver.svg(),
            title: AppString.driverBus,
            subtitle: AppString.activateService,
            onPressed: () => HelpFunctions.customModalSheet(
                context: context, child: BottomSheetDriver()),
          ),
        ],
      ),
    );
  }
}
