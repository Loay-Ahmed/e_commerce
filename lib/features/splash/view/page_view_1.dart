import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors.dart';

class PageView1 extends StatelessWidget {
  const PageView1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(AssetsData.backPage1),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      // "تخط",
                      S.of(context).splashskip,
                      style: GoogleFonts.cairo(
                        color: CustomColors.grey400,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Image.asset(AssetsData.imagePage1, width: 250, height: 270),
              SizedBox(height: 100),
              Text(
                /* "${S.of(context).splash_1_title}" */
                "مرحبا بك في FruitHUB",
                style: GoogleFonts.cairo(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 301,
                child: Text(
                  "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
                  /* S.of(context).splash_1_text */
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: CustomColors.green500,
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
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
