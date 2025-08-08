import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/features/trace_order/data/models/order_status_model.dart';
import 'package:flutter/material.dart';

class TrackOrderDetails extends StatelessWidget {
  const TrackOrderDetails({super.key, required this.orderStatusModel});
  final OrderStatusModel orderStatusModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Timeline indicator column
            SizedBox(
              width: 20,
              height: 40,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Circle indicator
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color:
                          orderStatusModel.isCircleCompleted
                              ? CustomColors.green1_500
                              : CustomColors.grey300,
                      shape: BoxShape.circle,
                    ),
                  ),

                  // Bottom line (hidden for last item)
                  if (!orderStatusModel.isLast)
                    Container(
                      width: 2,
                      height: 28,
                      color:
                          orderStatusModel.isLineCompleted
                              ? CustomColors.green500
                              : CustomColors.grey300,
                    ),
                ],
              ),
            ),

            SizedBox(width: 8),

            // Content
            Transform.translate(
              offset: Offset(0, -5),
              child: Text(
                orderStatusModel.title,
                style:
                    orderStatusModel.isCircleCompleted
                        ? CustomFonts.cairoTextStyleBold_13grey950w600
                        : CustomFonts.cairoTextStyleBold_13grey400w600,
              ),
            ),
            Spacer(),

            // Date
            Transform.translate(
              offset: Offset(0, -5),
              child: Text(
                orderStatusModel.date,
                style: CustomFonts.cairoTextStyleBold_13grey400w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
