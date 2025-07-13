import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OneStep extends StatelessWidget {
  const OneStep({
    super.key,
    required this.isChecked,
    required this.title,
    required this.stepNumber,
  });

  final String title;
  final bool isChecked;
  final int stepNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 12.5,
          backgroundColor:
              isChecked ? CustomColors.green1_500 : CustomColors.grey50,
          child:
              isChecked
                  ? SvgPicture.asset('assets/images/completed.svg')
                  : Text(
                    '$stepNumber',
                    style: CustomFonts.cairoTextStyleBold_13grey950w600,
                  ),
        ),
        SizedBox(width: 4),
        Text(
          title,
          style:
              isChecked
                  ? CustomFonts.cairoTextStyleBold_13green1_500
                  : CustomFonts.cairoTextStyleBold_13grey300,
        ),
      ],
    );
  }
}
