import 'package:flutter/material.dart';

import '../../../../utils/constants/app colors/app_colors.dart';
import '../../../../utils/constants/sizes.dart';

class ZMRoundedContainer extends StatelessWidget {
  const ZMRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = CustomSizes.cardRadiusLg,
    this.padding,
    this.child,
    this.backgoundColor = AppColor.white,
    this.margin,
    this.showBorder = false,
    this.borderColor = AppColor.borderPrimary,
  });

  final double? width;
  final double? height;
  final double radius;
  final bool showBorder;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final Color backgoundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: showBorder ? Border.all(color: borderColor) : null,
        borderRadius: BorderRadius.circular(radius),
        color: backgoundColor,
      ),
      child: child,
    );
  }
}
