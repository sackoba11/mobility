import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/app colors/app_colors.dart';
import '../../assets/assets.gen.dart';

class ZMCircularImage extends StatelessWidget {
  const ZMCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.width = 56,
    this.height = 56,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: isNetworkImage
            ? CachedNetworkImage(
                filterQuality: FilterQuality.high,
                imageUrl: image,
                fit: fit,
                color: overlayColor,
                placeholder: (context, url) => CircleAvatar(
                  radius: 100,
                ),
                imageBuilder: (context, image) => CircleAvatar(
                  backgroundImage: image,
                  radius: 100,
                ),
                errorWidget: (context, url, error) => CircleAvatar(
                  radius: 100,
                  child: Icon(
                    Icons.error_outline_rounded,
                    color: AppColor.primary,
                  ),
                ),
              )
            : Assets.user.image(height: height, width: width));
  }
}
