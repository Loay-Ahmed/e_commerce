import 'package:e_commerce/core/widgets/custom_nav_bar.dart';
import 'package:e_commerce/features/home/view/widgets/header_widget.dart';
import 'package:e_commerce/features/home/view/widgets/offer_widget.dart';
import 'package:e_commerce/features/home/view/widgets/popular_products_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                HeaderWidget(),
                SizedBox(height: 12),
                OfferWidget(),
                SizedBox(height: 12),
                PopularProductsWidget(),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CustomNavBar(),
    );
  }
}
