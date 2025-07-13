import 'package:e_commerce/core/widgets/product_card_widget.dart';
import 'package:e_commerce/features/home/data/dummy_data.dart';
import 'package:flutter/material.dart';

class CustomGridViewPopularProducts extends StatelessWidget {
  const CustomGridViewPopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: dummyProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      // shrinkWrap and physics are very important when using GridView.builder (or ListView) inside another scrollable widget like a Column or SingleChildScrollView.
      // shrinkWrap tells the GridView to only take up as much vertical space as its children need.
      // without shrinkWrap: true, GridView tries to take infinite height, which causes layout errors
      shrinkWrap: true,
      // physics, It disables internal scrolling of the GridView.
      // Don't scroll this grid — let the parent scroll view handle scrolling.
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return ProductCardWidget(product: dummyProducts[index], index: index);
      },
    );
  }
}
