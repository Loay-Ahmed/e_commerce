import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/widgets/custom_grid_view_popular_products.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:flutter/material.dart';

class PopularProductsScreen extends StatelessWidget {
  const PopularProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: 'الأكثر مبيعا'),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Text(
              'الأكثر مبيعا',
              style: CustomFonts.cairoTextStyleBold_19grey950w700,
            ),
            SizedBox(height: 8),
            CustomGridViewPopularProducts(),
          ],
        ),
      ),
    );
  }
}
