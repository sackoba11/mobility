import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class BodyScreenWrapper extends StatelessWidget {
  const BodyScreenWrapper({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: CustomSizes.defaultSpace,
          vertical: CustomSizes.spaceBtwItems),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
