import 'package:e_commerce/features/trace_order/data/models/order_status_model.dart';
import 'package:e_commerce/features/trace_order/presentation/widgets/track_order_details.dart';
import 'package:flutter/material.dart';

class OrderTrackStepsDetails extends StatelessWidget {
  const OrderTrackStepsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 23),
        TrackOrderDetails(
          orderStatusModel: OrderStatusModel(
            title: 'تتبع الطلب',
            date: '22 مارس, 2024',
            isCircleCompleted: true,
            isLineCompleted: true,
            isFirst: true,
          ),
        ),
        TrackOrderDetails(
          orderStatusModel: OrderStatusModel(
            title: 'قبول الطلب',
            date: '22 مارس, 2024',
            isCircleCompleted: true,
            isLineCompleted: true,
          ),
        ),
        TrackOrderDetails(
          orderStatusModel: OrderStatusModel(
            title: 'تم شحن الطلب',
            date: '22 مارس, 2024',
            isCircleCompleted: true,
            isLineCompleted: false,
          ),
        ),
        TrackOrderDetails(
          orderStatusModel: OrderStatusModel(
            title: 'جاري التوصيل',
            date: 'قيد الانتظار',
            isCircleCompleted: false,
            isLineCompleted: false,
          ),
        ),
        TrackOrderDetails(
          orderStatusModel: OrderStatusModel(
            title: 'تم التسليم',
            date: 'تم التسليم',
            isCircleCompleted: false,
            isLineCompleted: false,
            isLast: true,
          ),
        ),
      ],
    );
  }
}
