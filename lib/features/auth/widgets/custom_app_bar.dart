import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors.dart';

class CustomAppBar extends StatelessWidget {
   const CustomAppBar({super.key, required this.title});

   final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xffF1F1F5)),
            ),
            child: Icon(
              size: 20,
              Icons.arrow_back_ios,
              color: CustomColors.grey950,
            ),
          ),
        ),
        const Spacer(),
        Text(
          title,
          style: GoogleFonts.cairo(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CustomColors.grey950,
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
