import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ملخص الطلب:',
          style: CustomFonts.cairoTextStyleBold_13grey950w700,
        ),
        SizedBox(height: 8),
        Container(
          height: 130,
          decoration: BoxDecoration(
            color: CustomColors.grey,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              // Change border color based on selection state.
              color: CustomColors.grey,
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'المجموع الفرعى:',
                    style: CustomFonts.cairoTextStyleBold_13grey500w400,
                  ),
                  Text(
                    '150 جنيه',
                    style: CustomFonts.cairoTextStyleBold_16grey950w600,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'التوصيل:',
                    style: CustomFonts.cairoTextStyleBold_13grey500w400,
                  ),
                  Text(
                    '30 جنية',
                    style: CustomFonts.cairoTextStyleBold_13grey500w600,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Divider(height: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الكلى:',
                    style: CustomFonts.cairoTextStyleBold_16grey950w700,
                  ),
                  Text(
                    '180 جنيه',
                    style: CustomFonts.cairoTextStyleBold_16grey950w700,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
