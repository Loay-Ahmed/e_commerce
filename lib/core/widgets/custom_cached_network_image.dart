import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/widgets/cutom_circle_prog_indicator_for_social_button.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.contain,
      imageUrl: imageUrl,
      height: 20,
      width: 20,
      placeholder: (context, url) => CustomCircleProgIndicatorForSocialButton(),
      errorWidget:
          (context, url, error) =>
              const Icon(Icons.error_outline, color: Colors.red, size: 20),
    );
  }
}
