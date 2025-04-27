import 'package:e_commerce/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../generated/l10n.dart';

class PageView2 extends StatelessWidget {
  const PageView2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Image.asset(
              "assets/images/back_page_2.png",
              fit: BoxFit.fitWidth,
            ),
          ),

          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 6,),
              Image.asset(
                "assets/images/image_page_2.png",
                width: 250,
                height: 270,
              ),
              SizedBox(height: 100),
              Text(
                S.of(context).splash_2_title,
                style: GoogleFonts.cairo(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 301,
                child: Text(
                  S.of(context).splash_2_text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 70),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 11,
                    height: 11,
                    decoration: BoxDecoration(
                      color: CustomColors.green1_500,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 11,
                    height: 11,
                    decoration: BoxDecoration(
                      color: CustomColors.green1_500,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              SizedBox(
                width: 343,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: CustomColors.green1_500,
                  ),
                  child: Text(
                    S.of(context).splash_button,
                    style: GoogleFonts.cairo(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
