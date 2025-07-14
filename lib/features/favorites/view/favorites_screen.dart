import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/widgets/custom_nav_bar.dart';
import 'package:e_commerce/core/widgets/product_card_widget.dart';
import 'package:e_commerce/features/home/data/dummy_data.dart';

import '../../auth/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../home/data/models/product_model.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  List<ProductModel?> getFavorite() {
    return dummyProducts.map((product) {
      if (product.isFavorite)
        return product;
      else
        return null;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final favorite = getFavorite();
    favorite.removeWhere((product) => product == null);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // AppBar
              CustomAppBar(title: "المفضلة"),
              SizedBox(height: 30),
              // GridView of the favorite products
              Expanded(
                child: GridView.builder(
                  itemCount: favorite.length,
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
                    return favorite[index] != null
                        ? ProductCardWidget(
                          product: favorite[index]!,
                          index: index,
                        )
                        : null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
