import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/features/checkout/data/models/payment_intent_input_model.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makeStripePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });

  void makePaypalPayment({required BuildContext context});
}
