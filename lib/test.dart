import 'package:flutter/material.dart';

class OrderTrackingTimeline extends StatelessWidget {
  const OrderTrackingTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildTimelineItem(
            title: 'تتبع الطلب',
            date: '22 مارس, 2024',
            isCircleCompleted: true,
            isLineCompleted: true,
            isFirst: true,
          ),
          _buildTimelineItem(
            title: 'قبول الطلب',
            date: '22 مارس, 2024',
            isCircleCompleted: true,
            isLineCompleted: true,
          ),
          _buildTimelineItem(
            title: 'تم شحن الطلب',
            date: '22 مارس, 2024',
            isCircleCompleted: true,
            isLineCompleted: false,
          ),
          _buildTimelineItem(
            title: 'جاري التوصيل',
            date: 'قيد الانتظار',
            isCircleCompleted: false,
            isLineCompleted: false,
          ),
          _buildTimelineItem(
            title: 'تم التسليم',
            date: 'تم التسليم',
            isCircleCompleted: false,
            isLineCompleted: false,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String date,
    required bool isCircleCompleted,
    required bool isLineCompleted,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Timeline indicator column
          SizedBox(
            width: 20,
            height: 60,
            child: Column(
              children: [
                // Top line (hidden for first item)
                // if (!isFirst)
                //   Container(
                //     width: 2,
                //     height: 15,
                //     color: isCompleted ? Colors.green : Colors.grey[300],
                //   ),

                // Circle indicator
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: isCircleCompleted ? Colors.green : Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                ),

                // Bottom line (hidden for last item)
                if (!isLast)
                  Container(
                    width: 2,
                    height: 48,
                    color: isLineCompleted ? Colors.green : Colors.grey[300],
                  ),
              ],
            ),
          ),

          SizedBox(width: 8),

          // Content
          Transform.translate(
            offset: Offset(0, -8),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isCircleCompleted ? Colors.black : Colors.grey[500],
              ),
            ),
          ),
          Spacer(),

          // Date
          Transform.translate(
            offset: Offset(0, -8),
            child: Text(
              date,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Data model for order status
class OrderStatus {
  final String title;
  final String date;
  final bool isCompleted;

  OrderStatus({
    required this.title,
    required this.date,
    required this.isCompleted,
  });
}

// Usage example
class OrderTrackingExample extends StatelessWidget {
  const OrderTrackingExample({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OrderStatus> sampleStatuses = [
      OrderStatus(
        title: 'تتبع الطلب',
        date: '22 مارس, 2024',
        isCompleted: true,
      ),
      OrderStatus(
        title: 'قبول الطلب',
        date: '22 مارس, 2024',
        isCompleted: true,
      ),
      OrderStatus(
        title: 'تم شحن الطلب',
        date: '22 مارس, 2024',
        isCompleted: true,
      ),
      OrderStatus(
        title: 'جاري التوصيل',
        date: 'قيد الانتظار',
        isCompleted: false,
      ),
      OrderStatus(title: 'تم التسليم', date: 'تم التسليم', isCompleted: false),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('تتبع الطلب')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Simple version
            OrderTrackingTimeline(),

            SizedBox(height: 20),

            // Custom version with data model
            // OrderTrackingTimeline(),
          ],
        ),
      ),
    );
  }
}
