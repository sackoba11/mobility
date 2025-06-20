import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants/app colors/app_colors.dart';
import '../../utils/constants/typography/typography.dart';

class CustomButtonWithoutIcon extends StatelessWidget {
  const CustomButtonWithoutIcon(
      {super.key,
      required this.title,
      this.onPressed,
      this.loading,
      this.icon});
  final String title;
  final void Function()? onPressed;
  final ValueNotifier<bool>? loading;
  final SvgPicture? icon;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> defaultLoading = ValueNotifier(false);
    return TextButton(
      onPressed: onPressed,
      child: Container(
          width: double.infinity,
          height: 60,
          decoration: ShapeDecoration(
            color: AppColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: ValueListenableBuilder(
            valueListenable: loading ?? defaultLoading,
            builder: (_, loardingValue, child) {
              return loardingValue
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (icon != null)
                          Row(
                            children: [
                              icon!,
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        AppTypography.medium16(
                            text: title, color: AppColor.white),
                      ],
                    );
            },
          )),
    );
  }
}
