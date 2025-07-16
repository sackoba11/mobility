import 'package:flutter/material.dart';

import '../../../../utils/constants/app colors/app_colors.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 5,
      decoration: ShapeDecoration(
        color: AppColor.darkGrey,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColor.darkGrey),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }
}
