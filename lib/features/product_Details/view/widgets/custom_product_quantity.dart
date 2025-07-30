import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomProductQuantity extends StatelessWidget {
  const CustomProductQuantity({super.key, this.isSmall = false});

  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    final double width = isSmall ? 28 : 40;
    final double height = isSmall ? 14 : 16;
    return Row(
      children: [
        Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            color: CustomColors.green1_500,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Image.asset(
              AssetsData.plus,
              width: height,
              height: height,
              // color: Colors.white,
            ),
            onPressed: () {
              {}
            },
          ),
        ),
        SizedBox(width: 16),
        Text("1", style: GoogleFonts.cairo(fontSize: height)),
        SizedBox(width: 16),
        Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            color: Color(0xffF3F5F7),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Image.asset(
              AssetsData.minus,
              width: height,
              height: height,
              // color,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
