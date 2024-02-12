import 'package:flutter/material.dart';

import '../../constants/app colors/app_colors.dart';

class CustomInput extends StatelessWidget {
  final String? hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  const CustomInput(
      {super.key,
      this.hint,
      required this.controller,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
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
