import 'package:e_commerce/core/utils/assets_data.dart';
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
          AssetsData.exipdate,
          '${product.expireDate!.toInt()} عام',
          'الصلاحية',
        ),
        buildInfoCard(
          AssetsData.organic,
          '${product.organicPercentage}',
          'أورجانيك',
        ),
        buildInfoCard(
          AssetsData.calories,
          '${product.calories} كالوري',
          'لكل 100 جرام',
        ),
        buildInfoCard(AssetsData.star, '${product.reviewsRate}', 'التقييم'),
      ],
    );
  }
}
