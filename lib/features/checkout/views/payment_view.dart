import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/checkout/data/models/payment_intent_input_model.dart';

import 'package:e_commerce/features/checkout/view_model/Cubits/form_controller_cubit/form_controller_cubit.dart';
import 'package:e_commerce/features/checkout/view_model/Cubits/payment_cubit/payment_cubit.dart';

import 'package:e_commerce/features/checkout/views/success_view.dart';

import 'package:e_commerce/features/checkout/views/widgets/checkout_delivery_steps.dart';
import 'package:e_commerce/features/checkout/views/widgets/confirm_your_order.dart';

import 'package:e_commerce/features/checkout/views/widgets/custom_form_field.dart';
import 'package:e_commerce/features/checkout/views/widgets/order_summary.dart';
import 'package:e_commerce/features/checkout/views/widgets/payment_way.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  // final UserInfoFormController userInfoFormController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: 'الدفع', hasBell: false),
      body: Padding(
        padding: const EdgeInsets.only(right: 14.5, left: 15.5, top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(
              child: CheckoutDeliverySteps(
                step1: true,
                step2: true,
                step3: true,
                step4: false,
              ),
            ),
            SizedBox(height: 24),
            PaymentWay(),
            SizedBox(height: 16),
            OrderSummary(),
            SizedBox(height: 16),
            ConfirmYourOrder(),
            SizedBox(height: 60),
            BlocConsumer<PaymentCubit, PaymentState>(
              listener: (context, state) {
                if (state is PaymentSuccess) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SuccessView(),
                    ),
                  );
                }

                if (state is PaymentFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errMessage)));
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomButton(
                      text: 'تأكيد الطلب',
                      isLoading: state is PaymentLoading ? true : false,
                      onPress: () {
                        // card payment
                        if (BlocProvider.of<PaymentCubit>(context).cardIndex ==
                            0) {
                          PaymentIntentInputModel paymentIntentInputModel =
                              PaymentIntentInputModel(
                                amount: '100', // Example amount in cents
                                currency: 'usd',
                                customerId: 'cus_SfVClsopZ6oV5Y',
                              );

                          BlocProvider.of<PaymentCubit>(
                            context,
                          ).makeStripePayment(
                            paymentIntentInputModel: paymentIntentInputModel,
                          );
                        } else {
                          BlocProvider.of<PaymentCubit>(
                            context,
                          ).makePaypalPayment(context);
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
