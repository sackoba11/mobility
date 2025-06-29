import 'package:flutter/material.dart';

import '../../utils/constants/app colors/app_colors.dart';

class CustomInput extends StatelessWidget {
  final String? hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int? maxlength;

  const CustomInput(
      {super.key,
      this.hint,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.validator,
      this.maxlength});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        maxLength: maxlength,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primary),
                borderRadius: BorderRadius.circular(15)),
            hintText: hint,
            hintStyle: TextStyle(color: AppColor.primary)),
      ),
    );
  }
}
