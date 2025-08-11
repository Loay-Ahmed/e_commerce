import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/cutom_circle_prog_indicator_for_social_button.dart';
import 'package:flutter/material.dart';

class CustomAvatarProfilePicture extends StatelessWidget {
  const CustomAvatarProfilePicture({
    super.key,
    required this.image,
    required this.width,
    required this.height,
  });

  final String image;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: width,
        height: height,

        decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
        ),
      ),
    );
  }
}
