import 'package:flutter/material.dart';

import '../../constants/app colors/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String?> onChanged;
  final TextEditingController textEditingController;
  final String hintText;
  const CustomSearchBar(
      {super.key,
      required this.onChanged,
      required this.textEditingController,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColor.black,
      keyboardType: TextInputType.phone,
      controller: textEditingController,
      onChanged: onChanged,
      decoration: InputDecoration(
          focusColor: AppColor.primary,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.primary),
              borderRadius: BorderRadius.circular(10)),
          hintText: hintText,
          hintStyle: TextStyle(color: AppColor.black)),
    );
  }
}
