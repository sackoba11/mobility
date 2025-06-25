import 'package:flutter/material.dart';

import '../../../utils/constants/app colors/app_colors.dart';
import '../../assets/assets.gen.dart';
import '../images/circular_image.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key, required this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ZMCircularImage(
        image: Assets.robot.image().toString(),
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'SackoBA',
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.apply(color: AppColor.white),
      ),
      subtitle: Text(
        'Sackobaservice@gmail.com',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: AppColor.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.edit, color: AppColor.white),
      ),
    );
  }
}
