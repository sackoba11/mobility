import 'package:flutter/material.dart';

import '../../constants/app colors/app_colors.dart';

class CustomInput extends StatelessWidget {
  final String? hint;
  final String? textError;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final validator;
  final int? maxlength;

  const CustomInput(
      {super.key,
      this.hint,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.textError,
      this.validator,
      this.maxlength});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        maxLength: maxlength,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            errorText: textError,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primary),
                borderRadius: BorderRadius.circular(15)),
            hintText: hint,
            hintStyle: TextStyle(color: AppColor.black)),
      ),
    );
  }
}
