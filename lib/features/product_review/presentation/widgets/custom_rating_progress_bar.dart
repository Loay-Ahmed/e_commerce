import 'package:e_commerce/core/fonts.dart';
import 'package:flutter/material.dart';

class RatingData {
  final int stars;
  double percentage;
  int numberOfStars;

  RatingData({
    required this.stars,
    required this.percentage,
    required this.numberOfStars,
  });
}

class RatingProgressBar extends StatelessWidget {
  final RatingData rating;
  final Color filledColor;
  final Color unfilledColor;
  final double barHeight;

  const RatingProgressBar({
    super.key,
    required this.rating,
    required this.filledColor,
    required this.unfilledColor,
    required this.barHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Progress bar
        Expanded(
          child: Container(
            height: barHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(barHeight / 2),
              color: unfilledColor,
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: rating.percentage /* /100 */,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(barHeight / 2),
                  color: filledColor,
                ),
              ),
            ),
          ),
        ),

        SizedBox(width: 15),
        Text(
          '${rating.stars}',
          style: CustomFonts.cairoTextStyleBold_13grey950w600,
        ),
      ],
    );
  }
}
