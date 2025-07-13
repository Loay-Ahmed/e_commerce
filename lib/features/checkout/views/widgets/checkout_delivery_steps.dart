import 'package:e_commerce/features/checkout/views/widgets/one_step.dart';
import 'package:flutter/material.dart';

class CheckoutDeliverySteps extends StatelessWidget {
  const CheckoutDeliverySteps({
    super.key,
    required this.step1,
    required this.step2,
    required this.step3,
    required this.step4,
  });

  final bool step1;
  final bool step2;
  final bool step3;
  final bool step4;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OneStep(isChecked: step1, title: 'الشحن', stepNumber: 1),
        OneStep(isChecked: step2, title: 'العنوان', stepNumber: 2),
        OneStep(isChecked: step3, title: 'الدفع و المراجعة', stepNumber: 3),
        OneStep(isChecked: step4, title: 'نجح', stepNumber: 4),
      ],
    );
  }
}
