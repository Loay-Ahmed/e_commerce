import 'package:e_commerce/features/trace_order/data/models/order_model.dart';
import 'package:e_commerce/features/trace_order/data/models/order_status_model.dart';
import 'package:e_commerce/features/trace_order/presentation/widgets/track_order_details.dart';
import 'package:e_commerce/generated/l10n.dart';
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
            title: S.of(context).track_order,
            date: orderModel.orderTrackingDate ?? S.of(context).pending,
            isCircleCompleted: orderModel.orderTracking!,
            isLineCompleted:
                orderModel.orderTracking! && orderModel.orderAccepted!,
            isFirst: true,
          ),
        ),
        TrackOrderDetails(
          orderStatusModel: OrderStatusModel(
            title: S.of(context).order_accepted,
            date: orderModel.orderAcceptedDate ?? S.of(context).pending,
            isCircleCompleted: orderModel.orderAccepted!,
            isLineCompleted:
                orderModel.orderAccepted! && orderModel.orderShipped!,
          ),
        ),
        TrackOrderDetails(
          orderStatusModel: OrderStatusModel(
            title: S.of(context).order_shipped,
            date: orderModel.orderShippedDate ?? S.of(context).pending,
            isCircleCompleted: orderModel.orderShipped!,
            isLineCompleted:
                orderModel.orderShipped! && orderModel.orderOutForDelivery!,
          ),
        ),
        TrackOrderDetails(
          orderStatusModel: OrderStatusModel(
            title: S.of(context).out_for_delivery,
            date: orderModel.orderOutForDeliveryDate ?? S.of(context).pending,
            isCircleCompleted: orderModel.orderOutForDelivery!,
            isLineCompleted:
                orderModel.orderOutForDelivery! && orderModel.orderShipped!,
          ),
        ),
        TrackOrderDetails(
          orderStatusModel: OrderStatusModel(
            title: S.of(context).order_delivered,
            date: orderModel.orderShippedDate ?? S.of(context).pending,
            isCircleCompleted: orderModel.orderShipped!,
            isLineCompleted: false,
            isLast: true,
          ),
        ),
      ],
    );
  }
}
