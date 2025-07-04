import 'package:flutter/material.dart';

import '../custom_shapes/containers/primary_header_container.dart';
import '../../../utils/constants/app colors/app_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.bottomWiget,
    required this.title,
  });
  final String title;
  final Widget bottomWiget;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      expandedHeight: 240,
      flexibleSpace: PrimaryHeaderContainer(
        title: title,
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(ZMDeviceUtils.getAppBarHeight() * 1.95),
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.background,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(CustomSizes.borderRadiusLg),
                  topRight: Radius.circular(CustomSizes.borderRadiusLg))),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: CustomSizes.defaultSpace),
            child: Column(
              children: [
                const SizedBox(height: CustomSizes.spaceBtwItems),
                Container(
                  width: 40,
                  height: 5,
                  decoration: ShapeDecoration(
                    color: AppColor.darkGrey,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: AppColor.darkGrey),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
                const SizedBox(height: CustomSizes.spaceBtwItems),
                bottomWiget,
                const SizedBox(height: CustomSizes.spaceBtwItems),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
