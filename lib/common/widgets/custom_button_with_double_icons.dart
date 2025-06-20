import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobility/common/assets/assets.gen.dart';

import '../../utils/constants/app colors/app_colors.dart';
import '../../utils/constants/typography/typography.dart';

class CustomButtonWithDoubleIcons extends StatelessWidget {
  final SvgPicture icon;
  final String subtitle;
  final String title;
  final void Function()? onPressed;
  const CustomButtonWithDoubleIcons(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.primary, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon,
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTypography.mediumDefault(
                          text: title, color: AppColor.white),
                      AppTypography.lightSmall(
                          text: subtitle, color: AppColor.white)
                    ],
                  ),
                ],
              ),
              Assets.next.svg(),
              // SvgPicture.asset(AppString.nextSvg)
            ],
          ),
        ),
      ),
    );
  }
}
