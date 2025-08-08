import 'dart:developer';

import 'package:e_commerce/features/checkout/data/repos/checkout_repo.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/payment_intent_input_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.checkoutRepo}) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;
  String totalPrice = '';
  int numberOfOrders = 0;
  int cardIndex = 0;
  Future makeStripePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentLoading());

    var data = await checkoutRepo.makeStripePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );

    data.fold((l) {
      log(l.errMessage);
      emit(PaymentFailure(l.errMessage));
    }, (r) => emit(PaymentSuccess()));
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }

  void makePaypalPayment(BuildContext context) {
    checkoutRepo.makePaypalPayment(context: context);
  }

  void updateCardIndex(int index) {
    emit(PaymentMethodChanged());
    cardIndex = index;
  }

  void updateTotalPriceAndNumberOfOrders({
    required String totalPrice,
    required int numberOfOrders,
  }) {
    totalPrice = totalPrice;
    numberOfOrders = numberOfOrders;
  }
}
