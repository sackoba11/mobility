import 'package:flutter/material.dart';

import '../../../../utils/constants/app colors/app_colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../help_functions/help_functions.dart';

class ZMSearchContainer extends StatelessWidget {
  const ZMSearchContainer({
    super.key,
    required this.text,
    this.icon = Icons.search,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding =
        const EdgeInsets.symmetric(horizontal: CustomSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final dark = HelpFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: ZMDeviceUtils.getScreenWidth(context),
          padding: EdgeInsets.all(CustomSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? AppColor.dark
                    : AppColor.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: AppColor.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: AppColor.darkGrey),
              const SizedBox(width: CustomSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
