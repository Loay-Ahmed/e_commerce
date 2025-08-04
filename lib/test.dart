// import 'package:flutter/material.dart';

// class RatingProgressChart extends StatelessWidget {
//   final List<RatingData> ratings;
//   final Color filledColor;
//   final Color unfilledColor;
//   final double barHeight;
//   final double spacing;

//   const RatingProgressChart({
//     super.key,
//     required this.ratings,
//     this.filledColor = Colors.orange,
//     this.unfilledColor = const Color(0xFFE0E0E0),
//     this.barHeight = 8.0,
//     this.spacing = 12.0,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children:
//           ratings
//               .map(
//                 (rating) => Padding(
//                   padding: EdgeInsets.only(bottom: spacing),
//                   child: RatingProgressBar(
//                     rating: rating,
//                     filledColor: filledColor,
//                     unfilledColor: unfilledColor,
//                     barHeight: barHeight,
//                   ),
//                 ),
//               )
//               .toList(),
//     );
//   }
// }

// class RatingProgressBar extends StatelessWidget {
//   final RatingData rating;
//   final Color filledColor;
//   final Color unfilledColor;
//   final double barHeight;

//   const RatingProgressBar({
//     Key? key,
//     required this.rating,
//     required this.filledColor,
//     required this.unfilledColor,
//     required this.barHeight,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         // Rating number
//         SizedBox(
//           width: 20,
//           child: Text(
//             '${rating.stars}',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//               color: Colors.black87,
//             ),
//           ),
//         ),
//         SizedBox(width: 12),

//         // Progress bar
//         Expanded(
//           child: Container(
//             height: barHeight,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(barHeight / 2),
//               color: unfilledColor,
//             ),
//             child: FractionallySizedBox(
//               alignment: Alignment.centerLeft,
//               widthFactor: rating.percentage / 100,
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(barHeight / 2),
//                   color: filledColor,
//                 ),
//               ),
//             ),
//           ),
//         ),

//         // Percentage text (optional)
//         SizedBox(width: 8),
//         SizedBox(
//           width: 40,
//           child: Text(
//             '${rating.percentage.toInt()}%',
//             style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class RatingData {
//   final int stars;
//   final double percentage;

//   RatingData({required this.stars, required this.percentage});
// }

// // Example usage widget
// class RatingChartExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Sample data - you can replace this with your actual data
//     final List<RatingData> sampleRatings = [
//       RatingData(stars: 5, percentage: 80.0),
//       RatingData(stars: 4, percentage: 65.0),
//       RatingData(stars: 3, percentage: 45.0),
//       RatingData(stars: 2, percentage: 25.0),
//       RatingData(stars: 1, percentage: 15.0),
//     ];

//     return Scaffold(
//       appBar: AppBar(title: Text('Rating Progress Chart')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Customer Reviews',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),

//             RatingProgressChart(
//               ratings: sampleRatings,
//               filledColor: Colors.orange,
//               unfilledColor: Colors.grey[300]!,
//               barHeight: 10.0,
//               spacing: 16.0,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
