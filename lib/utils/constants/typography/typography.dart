import 'package:flutter/material.dart';

class AppTypography {
  static regularSmall({String? text, Color? color}) {
    return Text(
      text!,
      style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w400),
    );
  }

  static Text regularDefault({String? text, Color? color}) {
    return Text(
      text!,
      style: TextStyle(color: color, fontSize: 17, fontWeight: FontWeight.w400),
    );
  }

  static Text regularBig({String? text, Color? color}) {
    return Text(
      text!,
      style: TextStyle(color: color, fontSize: 19, fontWeight: FontWeight.w400),
    );
  }

  static Text lightSmall({String? text, Color? color}) {
    return Text(
      text!,
      style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w400),
    );
  }

  static Text mediumDefault({String? text, Color? color}) {
    return Text(
      text!,
      style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.w500),
    );
  }

  static Text medium16({String? text, Color? color}) {
    return Text(
      text!,
      style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}
