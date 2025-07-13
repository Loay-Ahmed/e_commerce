class PaymentIntentInputModel {
  PaymentIntentInputModel({
    required this.customerId,
    required this.amount,
    required this.currency,
  });

  final String amount;

  final String currency;

  final String customerId;

  Map<String, String> toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
      'customer': customerId,
    };
  }
}
