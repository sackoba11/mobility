import 'package:flutter/material.dart';

import '../../../../utils/constants/app colors/app_colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'cirlcular_container.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: AppColor.primary,
        padding: EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: ZMCirlcularContainer(
                backgoundColor: AppColor.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: ZMCirlcularContainer(
                backgoundColor: AppColor.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
