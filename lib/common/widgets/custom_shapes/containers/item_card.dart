import 'package:flutter/material.dart';

import '../../../../utils/constants/app colors/app_colors.dart';
import '../../../../utils/constants/sizes.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
  });

  final Widget title;
  final Widget subTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.white, borderRadius: BorderRadius.circular(10)),
            child:
                ListTile(isThreeLine: true, title: title, subtitle: subTitle),
          ),
        ),
        SizedBox(
          height: CustomSizes.sm,
        )
      ],
    );
  }
}
