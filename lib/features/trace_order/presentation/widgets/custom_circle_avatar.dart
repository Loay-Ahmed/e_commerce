import 'package:e_commerce/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required this.image,
    required this.isDone,
  });

  final String image;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    final Color avatarColor =
        isDone ? CustomColors.green1_50 : CustomColors.grey50;
    final Color imageColor =
        isDone ? CustomColors.green1_500 : CustomColors.grey400;
    return CircleAvatar(
      backgroundColor: avatarColor,
      radius: 33,
      child: SvgPicture.asset(image, color: imageColor),
    );
  }
}
