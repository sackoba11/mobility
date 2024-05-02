import 'package:flutter/material.dart';
import 'package:mobility/app/assets/assets.gen.dart';

import '../../constants/app colors/app_colors.dart';
import '../../constants/typography/typography.dart';

class CustomButtonWithoutOnTap extends StatelessWidget {
  final icon;
  final String subtitle;
  final String title;
  const CustomButtonWithoutOnTap(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final typo = AppTypography();
    return Container(
      decoration: BoxDecoration(
          color: AppColor.black, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 25, top: 10, bottom: 20),
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
                    typo.mediumDefault(text: title, color: AppColor.white),
                    typo.lightSmall(text: subtitle, color: AppColor.white)
                  ],
                ),
              ],
            ),
            Assets.next.svg(),
            // SvgPicture.asset(AppString.nextSvg)
          ],
        ),
      ),
    );
  }
}
