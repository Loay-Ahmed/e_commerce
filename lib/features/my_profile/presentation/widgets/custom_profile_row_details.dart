import 'package:e_commerce/core/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomMyProfileRowDetails extends StatelessWidget {
  const CustomMyProfileRowDetails({
    super.key,
    required this.image,
    required this.text,
    required this.widget,
    required this.onTap,
    this.isLanguageRow = false,
  });

  final String image;
  final String text;
  final Widget widget;
  final void Function() onTap;
  final bool isLanguageRow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Row(
            children: [
              SvgPicture.asset(image),
              SizedBox(width: 7),
              Text(text, style: CustomFonts.cairoTextStyleBold_13grey400w600),
              Spacer(),
              if (isLanguageRow)
                Text(
                  'العربية',
                  style: CustomFonts.cairoTextStyleBold_13grey950w400,
                ),
              widget,
            ],
          ),
        ),
        Divider(height: 25, thickness: 0.2),
      ],
    );
  }
}
