import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/app colors/app_colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../../../views/home/controllers/home_user_controller.dart';
import '../images/circular_image.dart';

class UserProfileTile extends StatelessWidget implements PreferredSizeWidget {
  const UserProfileTile({
    super.key,
    required this.onPressed,
    required this.controller,
  });

  final VoidCallback onPressed;
  final HomeUserController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.background,
        leading: ZMCircularImage(
            isNetworkImage:
                (controller.currentUser?.photoURL != null) ? true : false,
            image: controller.currentUser!.photoURL!),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.currentUser!.displayName!.capitalize!,
              style: Theme.of(
                context,
              ).textTheme.labelLarge!.apply(
                  color: AppColor.primary, overflow: TextOverflow.ellipsis),
            ),
            Text(
              controller.currentUser!.email!,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.apply(
                  color: AppColor.primary, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
                size: 26,
              )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ZMDeviceUtils.getAppBarHeight());
}
