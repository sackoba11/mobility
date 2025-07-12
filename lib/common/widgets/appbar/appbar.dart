import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/app colors/app_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.actions,
    this.color = AppColor.white,
    this.leading,
    this.backgroundColor,
  });

  final Widget? title;
  final bool showBackArrow;
  final List<Widget>? actions;
  final Color? color;
  final Widget? leading;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: CustomSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back, color: color),
              )
            : leading,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ZMDeviceUtils.getAppBarHeight());
}
