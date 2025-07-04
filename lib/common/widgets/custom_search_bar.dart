import 'package:flutter/material.dart';

import '../../utils/constants/app colors/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String?> onChanged;
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType keyBoardtype;
  final void Function()? onPressedFilterIcon;
  final bool withfilter;
  const CustomSearchBar(
      {super.key,
      required this.onChanged,
      required this.textEditingController,
      required this.hintText,
      this.keyBoardtype = TextInputType.phone,
      this.onPressedFilterIcon,
      this.withfilter = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColor.primary,
      keyboardType: keyBoardtype,
      controller: textEditingController,
      onChanged: onChanged,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          focusColor: AppColor.primary,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.primary),
              borderRadius: BorderRadius.circular(10)),
          hintText: hintText,
          hintStyle: TextStyle(color: AppColor.primary),
          suffixIcon: withfilter
              ? IconButton(
                  onPressed: onPressedFilterIcon,
                  icon: const Icon(
                    Icons.filter_list_outlined,
                    size: 30,
                  ))
              : null),
    );
  }
}
