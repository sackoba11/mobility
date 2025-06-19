import 'package:flutter/material.dart';

class Illustrator extends StatelessWidget {
  final illustrator;
  final double height;
  final double width;
  const Illustrator({
    super.key,
    required this.illustrator,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: illustrator,
    );
  }
}
