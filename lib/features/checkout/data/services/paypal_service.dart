import 'dart:developer';

import 'package:e_commerce/core/utils/api_keys.dart';
import 'package:e_commerce/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:e_commerce/features/checkout/data/models/amount_model/details.dart';
import 'package:e_commerce/features/checkout/data/models/item_list_model/item.dart';
import 'package:e_commerce/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:e_commerce/features/checkout/views/success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class PaypalService {
  void executePaypalPayment(
    BuildContext context,
    ({AmountModel amount, ItemListModel itemList}) transactionsData,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: ApiKeys.clientId,
              secretKey: ApiKeys.secretKeyPaypal,
              transactions: [
                {
                  "amount": transactionsData.amount.toJson(),
                  "description": "The payment transaction description.",

                  "item_list": transactionsData.itemList.toJson(),
                },
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                log("onSuccess: $params");
                // Navigator.pop(context);
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SuccessView()));
              },
              onError: (error) {
                log("onError: $error");

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(error.toString())));
                // Navigator.of(context).pushAndRemoveUntil(
                //   MaterialPageRoute(builder: (context) => MyCartView()),
                //   (route) => false,
                // );
              },
              onCancel: () {
                print('cancelled:');
                // Navigator.pop(context);
              },
            ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionsData() {
    var amount = AmountModel(
      total: "100",
      currency: 'USD',
      details: Details(subtotal: '100', shipping: "0", shippingDiscount: 0),
    );

    List<OrderItemModel> orderItems = [
      OrderItemModel(name: "Apple", quantity: 4, price: '10', currency: "USD"),
      OrderItemModel(
        name: "Pineapple",
        quantity: 5,
        price: '12',
        currency: "USD",
      ),
    ];

    var itemList = ItemListModel(orders: orderItems);
    return (amount: amount, itemList: itemList);
  }
}
