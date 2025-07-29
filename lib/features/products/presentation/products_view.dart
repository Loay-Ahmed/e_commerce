import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/widgets/custom_cached_network_image.dart';
import 'package:e_commerce/core/widgets/custom_grid_view_popular_products.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:e_commerce/features/home/view/widgets/popular_products_widget.dart';
import 'package:e_commerce/features/home/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_our_products_widget.dart';

import 'package:e_commerce/features/search/presentation/widgets/custom_search_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: 'المنتجات', hasBackArrow: false),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBarButton(),
            SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'منتجاتنا',
                  style: CustomFonts.cairoTextStyleBold_16grey950w700,
                ),
                Container(
                  width: 44,
                  height: 31,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: CustomColors.grey60),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/arrow-swap-horizontal.svg',
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),

            SizedBox(height: 22),

            CustomOurProductsWidget(),
            SizedBox(height: 24),
            // PopularProductsWidget(isProductsWidget: true),
            // Expanded(
            //   child: CustomGridViewPopularProducts(
            //     scrollPhysics: false,
            //     shrinkWrap: false,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
