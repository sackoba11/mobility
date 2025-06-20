import 'package:flutter/material.dart';

class BodyWrapper extends StatelessWidget {
  const BodyWrapper({
    super.key,
    required this.children,
  });
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
