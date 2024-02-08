import 'package:flutter/material.dart';

import '../../constants/app colors/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String?> onChanged;
  final TextEditingController textEditingController;
  const CustomSearchBar(
      {super.key,
      required this.onChanged,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.phone,
      controller: textEditingController,
      onChanged: onChanged,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.primary),
              borderRadius: BorderRadius.circular(10)),
          hintText: "Bus Numéro ...",
          hintStyle: TextStyle(color: AppColor.black)),
    );
  }
}
