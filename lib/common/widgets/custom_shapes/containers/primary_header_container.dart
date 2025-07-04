import 'package:flutter/material.dart';

import '../../../../utils/constants/app colors/app_colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import 'cirlcular_container.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primary,
      padding: EdgeInsets.all(0),
      child: Stack(
        children: [
          Positioned(
            top: -150,
            right: -250,
            child: ZMCirlcularContainer(
              backgoundColor: AppColor.textWhite.withOpacity(0.1),
            ),
          ),
          Positioned(
            top: 100,
            right: -300,
            child: ZMCirlcularContainer(
              backgoundColor: AppColor.textWhite.withOpacity(0.1),
            ),
          ),
          Column(
        children: [
          SizedBox(height: ZMDeviceUtils.getAppBarHeight() * 1.5),
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: CustomSizes.defaultSpace,
              ),
              child: Text(
                title,
                style: TextStyle(fontSize: 30, color: AppColor.white),
              )),
          const SizedBox(height: CustomSizes.spaceBtwSections)
        ],
      ),
        ],
      ),
    );
  }
}
