import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/features/trace_order/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderTrackMainInfo extends StatelessWidget {
  const OrderTrackMainInfo({super.key, required this.orderModel});

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'طلب رقم ${orderModel.orderNumber}',
          style: CustomFonts.cairoTextStyleBold_13grey950w700,
        ),
        Text(
          'تم الطلب :${DateFormat('dd/MM/yyyy').format(orderModel.createdAt!)}',
          style: CustomFonts.cairoTextStyleBold_11grey400w400,
        ),
        Row(
          children: [
            Text(
              'عدد الطلبات: ',
              style: CustomFonts.cairoTextStyleBold_13grey400w400,
            ),
            Text(
              '${orderModel.numberOfOrders}      ${orderModel.orderPrice} جنيه',
              style: CustomFonts.cairoTextStyleBold_13grey950w700,
            ),
          ],
        ),
      ],
    );
  }
}
