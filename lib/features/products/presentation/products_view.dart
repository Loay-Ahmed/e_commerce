import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/home/view/widgets/popular_products_widget.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_our_products_widget.dart';

import 'package:e_commerce/features/search/presentation/widgets/custom_search_bar_button.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(
        title: S.of(context).nav_bar_products,
        hasBackArrow: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                    S.of(context).our_products,
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
                      AssetsData.arrowSwapHorizontal,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 22),

              CustomOurProductsWidget(),
              SizedBox(height: 24),
              PopularProductsWidget(),
              // Expanded(
              //   child: CustomGridViewPopularProducts(
              //     scrollPhysics: false,
              //     shrinkWrap: false,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
