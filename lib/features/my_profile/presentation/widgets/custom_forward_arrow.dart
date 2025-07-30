import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomForwardArrow extends StatelessWidget {
  const CustomForwardArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: SvgPicture.asset(
        width: 21,
        height: 21,
        color: CustomColors.grey950,
        AssetsData.arrowRight,
      ),
    );
  }
}
