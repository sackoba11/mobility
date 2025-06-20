import 'package:flutter/material.dart';

import '../../utils/constants/app string/app_string.dart';
import '../help_functions/help_functions.dart';

class CustomButtonLogout extends StatelessWidget {
  const CustomButtonLogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 372,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: const Border(
                bottom: BorderSide(color: Colors.red),
                top: BorderSide(color: Colors.red),
                left: BorderSide(color: Colors.red),
                right: BorderSide(color: Colors.red))),
        child: TextButton(
          onPressed: () {
            HelpFunctions.popupLogout();
          },
          child: Text(
            AppString.logout,
            style: const TextStyle(color: Colors.red),
          ),
        ));
  }
}
