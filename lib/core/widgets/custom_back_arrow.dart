import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBackArrow extends StatelessWidget {
  const CustomBackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black, // border color
            width: 0.08, // border width
          ),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 22,
          child: SvgPicture.asset(AssetsData.backArrow),
        ),
      ),
    );
  }
}
