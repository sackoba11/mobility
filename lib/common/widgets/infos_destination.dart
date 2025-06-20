import 'package:flutter/material.dart';
import 'package:mobility/common/assets/assets.gen.dart';

import '../../utils/constants/app colors/app_colors.dart';
import 'illustrator.dart';

class InfosDestination extends StatelessWidget {
  final String infos;
  const InfosDestination({
    super.key,
    required this.infos,
  });

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Illustrator(illustrator: Assets.oval.image(), height: 10, width: 10),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: SizedBox(
              width: sizes.width * .3,
              child: Text(
                infos,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColor.primary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
