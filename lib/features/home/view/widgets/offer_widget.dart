import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 158,
      decoration: BoxDecoration(color: Colors.orange),
      child: Image.asset(AssetsData.offerJpg),
    );
  }
}
