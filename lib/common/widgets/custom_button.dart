import 'package:flutter/material.dart';

import '../../utils/constants/app colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String? icon;
  final void Function()? ontap;
  final double radius;

  const CustomButton({
    super.key,
    required this.title,
    this.icon,
    required this.ontap,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(radius)),
      child: TextButton(
          onPressed: ontap,
          style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(const Size(60, 60))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (icon == null)
                  ? Container()
                  : Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(icon!))),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
              Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          )),
    );
  }
}
