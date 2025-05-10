import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNotifiedBell extends StatelessWidget {
  const CustomNotifiedBell({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetsData.notifiedBell, width: 34, height: 34);
  }
}
