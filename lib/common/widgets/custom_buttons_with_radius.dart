import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../assets/assets.gen.dart';
import '../../utils/constants/app colors/app_colors.dart';
import '../../utils/constants/typography/typography.dart';

class CustomButtonWithRadius extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final String onTap;
  const CustomButtonWithRadius({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(onTap);
        },
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.primary, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(icon),
                    const SizedBox(
                      width: 36,
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
        ));
  }
}
