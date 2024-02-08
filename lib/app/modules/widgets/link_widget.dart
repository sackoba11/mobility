import 'package:flutter/material.dart';

class LinkWidget extends StatelessWidget {
  final String text;
  const LinkWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(decoration: TextDecoration.underline),
    );
  }
}
