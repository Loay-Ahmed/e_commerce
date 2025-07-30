import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/checkout/views/widgets/checkout_delivery_steps.dart';

import 'package:e_commerce/features/home/view/home_view.dart';
import 'package:flutter/material.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: 'الدفع', hasBell: false, hasBackArrow: false),
      body: Padding(
        padding: const EdgeInsets.only(right: 14.5, left: 15.5, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: CheckoutDeliverySteps(
                step1: true,
                step2: true,
                step3: true,
                step4: true,
              ),
            ),
            SizedBox(height: 67),
            SizedBox(
              width: 154,
              height: 107,
              child: Image.asset(AssetsData.done),
            ),

            SizedBox(height: 33),
            Text(
              'تم بنجاح!',
              style: CustomFonts.cairoTextStyleBold_16grey950w700,
            ),
            SizedBox(height: 9),
            Text(
              'رقم الطلب : #123456789',
              style: CustomFonts.cairoTextStyleBold_13grey500w400,
            ),
            SizedBox(height: 200),

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(
                  text: 'تتبع الطلب',
                  onPress: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => PaymentView()),
                    // );
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomeView()),
                  (route) => false,
                );
              },
              child: SizedBox(
                height: 30,
                child: Stack(
                  children: [
                    Text(
                      'الرئيسية',
                      style: CustomFonts.cairoTextStyleBold_16green1_500w700,
                    ),
                    Positioned(
                      bottom: 8.5,
                      top: 20,
                      child: Container(
                        // Space between text and line
                        height: 1.0, // Thickness of the line
                        width: 65, // Adjust width as needed
                        color: CustomColors.green1_500, // Line color
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
