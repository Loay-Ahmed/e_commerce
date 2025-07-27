import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:e_commerce/features/product_Details/view/widgets/build_info_card_widget.dart';
import 'package:flutter/material.dart';

class ProductFeatureGrid extends StatelessWidget {
  const ProductFeatureGrid({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 342,
      shrinkWrap: true,
      mainAxisSpacing: 30,
      crossAxisSpacing: 15,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      childAspectRatio: 1.9,
      children: [
        buildInfoCard(
          'assets/images/exipdate.png',
          '${product.expireDate!.toInt()} عام',
          'الصلاحية',
        ),
        buildInfoCard(
          'assets/images/organic.png',
          '${product.organicPercentage}',
          'أورجانيك',
        ),
        buildInfoCard(
          'assets/images/calories.png',
          '${product.calories} كالوري',
          'لكل 100 جرام',
        ),
        buildInfoCard(
          'assets/images/star.png',
          '${product.reviewsRate}',
          'التقييم',
        ),
      ],
    );
  }
}
