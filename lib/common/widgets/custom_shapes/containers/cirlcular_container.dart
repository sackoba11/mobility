import 'package:flutter/material.dart';

import '../../../../utils/constants/app colors/app_colors.dart';


class ZMCirlcularContainer extends StatelessWidget {
  const ZMCirlcularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 4000,
    this.padding = 0,
    this.child,
    this.backgoundColor = AppColor.white,
    this.margin,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final EdgeInsets? margin;
  final Color? backgoundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgoundColor,
      ),
      child: child,
    );
  }
}
