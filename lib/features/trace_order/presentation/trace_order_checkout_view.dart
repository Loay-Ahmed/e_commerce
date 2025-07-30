import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/trace_order/presentation/widgets/track_order_card.dart';
import 'package:e_commerce/features/trace_order/presentation/widgets/track_order_step.dart';
import 'package:flutter/material.dart';

class TraceOrderCheckoutView extends StatelessWidget {
  const TraceOrderCheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: 'تتبع الطلب', hasBell: false),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TrackOrderCard(),

            SizedBox(height: 19),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              color: CustomColors.grey,
              child: Column(
                children: [
                  TrackOrderStep(
                    image: AssetsData.openBox,
                    isDone: true,
                    text: 'تتبع الطلب',
                    date: '22 مارس , 2024',
                    index: 1,
                  ),
                  TrackOrderStep(
                    image: AssetsData.acceptOrder,
                    isDone: true,
                    text: 'قبول الطلب',
                    date: '22 مارس , 2024',
                    index: 2,
                  ),
                  TrackOrderStep(
                    image: AssetsData.orderShipped,
                    isDone: true,
                    text: 'تم شحن الطلب',
                    date: '22 مارس , 2024',
                    index: 3,
                  ),
                  TrackOrderStep(
                    image: AssetsData.orderOutOfDelivery,
                    isDone: false,
                    text: 'خرج للتوصيل',
                    date: 'قيد الانتظار',
                    index: 4,
                  ),
                  TrackOrderStep(
                    image: AssetsData.orderDelivered,
                    isDone: false,
                    text: 'تم تسليم',
                    date: 'wait',
                    index: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
