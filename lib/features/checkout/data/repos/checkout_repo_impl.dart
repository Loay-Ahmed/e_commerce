import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:e_commerce/features/checkout/data/repos/checkout_repo.dart';
import 'package:e_commerce/features/checkout/data/services/paypal_service.dart';
import 'package:e_commerce/features/checkout/data/services/stripe_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  final PaypalService paypalService = PaypalService();
  @override
  Future<Either<Failure, void>> makeStripePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );

      return right(null);
    } on StripeException catch (e) {
      return left(
        ServerFailure(errMessage: e.error.message ?? 'Oops there was an error'),
      );
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  void makePaypalPayment({required BuildContext context}) {
    paypalService.executePaypalPayment(
      context,
      paypalService.getTransactionsData(),
    );
  }
}
