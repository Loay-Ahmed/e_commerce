import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/trace_order/presentation/widgets/track_order_card.dart';
import 'package:flutter/material.dart';

class TraceOrderMyProfileView extends StatelessWidget {
  const TraceOrderMyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: 'طلباتى', hasBell: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TrackOrderCard(isMyOrderProfile: true),
              SizedBox(height: 8),
              TrackOrderCard(isMyOrderProfile: true),
              SizedBox(height: 8),
              TrackOrderCard(isMyOrderProfile: true),
            ],
          ),
        ),
      ),
    );
  }
}
