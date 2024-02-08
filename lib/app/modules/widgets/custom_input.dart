import 'package:flutter/material.dart';

import '../../constants/app colors/app_colors.dart';

class CustomInput extends StatelessWidget {
  final String? hint;

  const CustomInput({
    super.key,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primary),
                borderRadius: BorderRadius.circular(15)),
            hintText: hint,
            hintStyle: TextStyle(color: AppColor.black)),
      ),
    );
  }
}
