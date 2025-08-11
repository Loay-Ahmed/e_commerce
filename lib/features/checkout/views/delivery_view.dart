import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:e_commerce/features/checkout/view_model/Cubits/payment_cubit/payment_cubit.dart';
import 'package:e_commerce/features/checkout/views/user_info_view.dart';
import 'package:e_commerce/features/checkout/views/widgets/checkout_delivery_card.dart';
import 'package:e_commerce/features/checkout/views/widgets/checkout_delivery_steps.dart';
import 'package:e_commerce/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: S.of(context).shipping, hasBell: false),
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
              title: S.of(context).cash_on_delivery,
              subtitle: S.of(context).pickup_delivery,
              priceText: '40 ${S.of(context).pound}',
            ),
            SizedBox(height: 8),
            CheckoutDeliveryCard(
              isSelected: true,
              title: S.of(context).buy_now_pay_later,
              subtitle: S.of(context).please_select_payment_method,
              priceText: S.of(context).free,
            ),
            SizedBox(height: 100),

            CustomButton(
              text: S.of(context).next,
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
