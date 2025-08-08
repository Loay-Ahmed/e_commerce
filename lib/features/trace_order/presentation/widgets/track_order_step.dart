import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/features/trace_order/presentation/widgets/custom_circle_avatar.dart';
import 'package:flutter/material.dart';

class TrackOrderStep extends StatelessWidget {
  const TrackOrderStep({
    super.key,
    required this.image,
    required this.isDone,
    required this.text,
    required this.date,
    required this.index,
  });

  final String image;
  final bool isDone;
  final String text;
  final String date;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomCircleAvatar(isDone: isDone, image: image),
            SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: CustomFonts.cairoTextStyleBold_13grey950w700),
                if (date != 'wait')
                  Text(
                    date,
                    style: CustomFonts.cairoTextStyleBold_13grey400w600,
                  ),
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        if (index != 5)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Divider(height: 32, thickness: 0.2, color: Colors.grey),
          ),
      ],
    );
  }
}
