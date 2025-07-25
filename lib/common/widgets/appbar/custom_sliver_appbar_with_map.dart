import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/app colors/app_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../custom_shapes/containers/header_bar.dart';

class CustomSliverAppBarWithMap extends StatelessWidget {
  const CustomSliverAppBarWithMap({
    super.key,
    required this.child,
    this.expandedHeight,
  });

  final Widget child;
  final double? expandedHeight;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      expandedHeight: expandedHeight ?? size.height.h * 0.58,
      flexibleSpace: Container(
          color: AppColor.background,
          child: Padding(
            padding: EdgeInsets.only(
              top: 24.h,
              bottom: 10.h,
            ),
            child: child,
          )),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(ZMDeviceUtils.getAppBarHeight()),
        child: Container(
          width: double.infinity,
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
                HeaderBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
