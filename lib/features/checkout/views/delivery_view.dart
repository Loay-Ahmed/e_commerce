import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/checkout/views/user_info_view.dart';
import 'package:e_commerce/features/checkout/views/widgets/checkout_delivery_card.dart';
import 'package:e_commerce/features/checkout/views/widgets/checkout_delivery_steps.dart';

import 'package:flutter/material.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: 'الشحن', hasBell: false),
      body: Padding(
        padding: const EdgeInsets.only(right: 14.5, left: 15.5, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              child: CheckoutDeliverySteps(
                step1: true,
                step2: false,
                step3: false,
                step4: false,
              ),
            ),
            SizedBox(height: 32),
            CheckoutDeliveryCard(
              isSelected: false,
              title: 'الدفع عند الاستلام',
              subtitle: 'التسليم من المكان',
              priceText: '40 جنيه',
            ),
            SizedBox(height: 8),
            CheckoutDeliveryCard(
              isSelected: true,
              title: 'اشترى الان و ادفع لاحقا',
              subtitle: 'يرجى تحديد طريقة الدفع',
              priceText: 'مجانى',
            ),
            SizedBox(height: 100),

            CustomButton(
              text: 'التالى',
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserInfoView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
