import 'package:e_commerce/features/trace_order/data/models/order_model.dart';
import 'package:e_commerce/features/trace_order/data/models/order_status_model.dart';
import 'package:e_commerce/features/trace_order/presentation/widgets/track_order_details.dart';
import 'package:flutter/material.dart';

class OrderTrackStepsDetails extends StatelessWidget {
  const OrderTrackStepsDetails({super.key, required this.orderModel});

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 23),
        TrackOrderDetails(
          orderStatusModel: OrderStatusModel(
            title: 'تتبع الطلب',
            date: orderModel.orderTrackingDate ?? 'قيد الانتظار',
            isCircleCompleted: orderModel.orderTracking!,
            isLineCompleted:
                orderModel.orderTracking! && orderModel.orderAccepted!,
            isFirst: true,
          ),
        ),
        TrackOrderDetails(
          orderStatusModel: OrderStatusModel(
            title: 'قبول الطلب',
            date: orderModel.orderAcceptedDate ?? 'قيد الانتظار',
            isCircleCompleted: orderModel.orderAccepted!,
            isLineCompleted:
                orderModel.orderAccepted! && orderModel.orderShipped!,
          ),
        ),
        TrackOrderDetails(
          orderStatusModel: OrderStatusModel(
            title: 'تم شحن الطلب',
            date: orderModel.orderShippedDate ?? 'قيد الانتظار',
            isCircleCompleted: orderModel.orderShipped!,
            isLineCompleted:
                orderModel.orderShipped! && orderModel.orderOutForDelivery!,
          ),
        ),
        TrackOrderDetails(
          orderStatusModel: OrderStatusModel(
            title: 'جاري التوصيل',
            date: orderModel.orderOutForDeliveryDate ?? 'قيد الانتظار',
            isCircleCompleted: orderModel.orderOutForDelivery!,
            isLineCompleted:
                orderModel.orderOutForDelivery! && orderModel.orderShipped!,
          ),
        ),
        TrackOrderDetails(
          orderStatusModel: OrderStatusModel(
            title: 'تم التسليم',
            date: orderModel.orderShippedDate ?? 'قيد الانتظار',
            isCircleCompleted: orderModel.orderShipped!,
            isLineCompleted: false,
            isLast: true,
          ),
        ),
      ],
    );
  }
}
