import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/cutom_circle_prog_indicator_for_social_button.dart';
import 'package:flutter/material.dart';

class CustomAvatarProfilePicture extends StatelessWidget {
  const CustomAvatarProfilePicture({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        placeholder:
            (context, url) => CustomCircleProgIndicatorForSocialButton(),
        errorWidget:
            (context, url, error) => Image.asset(
              AssetsData.profileImage,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
      ),
    );
  }
}
