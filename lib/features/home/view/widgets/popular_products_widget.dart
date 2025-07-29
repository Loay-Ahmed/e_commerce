import 'package:e_commerce/core/fonts.dart';

import 'package:e_commerce/core/widgets/custom_grid_view_popular_products.dart';

import 'package:e_commerce/features/home/view/popular_products_screen.dart';
import 'package:flutter/material.dart';

class PopularProductsWidget extends StatelessWidget {
  const PopularProductsWidget({super.key, this.isProductsWidget = false});

  final bool isProductsWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الأكثر مبيعاً',
                style: CustomFonts.cairoTextStyleBold_16grey950w700,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PopularProductsScreen(),
                    ),
                  );
                },
                child: Text(
                  'المزيد',
                  style: TextStyle(
                    fontFamily: 'cairo',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        isProductsWidget
            ? Expanded(
              child: CustomGridViewPopularProducts(
                scrollPhysics: false,
                shrinkWrap: false,
              ),
            )
            : CustomGridViewPopularProducts(),
      ],
    );
  }
}
