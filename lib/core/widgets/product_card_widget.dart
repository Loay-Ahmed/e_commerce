import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/custom_cached_network_image.dart';
import 'package:e_commerce/core/widgets/cutom_circle_prog_indicator_for_social_button.dart';

import 'package:e_commerce/features/home/data/models/product_model.dart';

import 'package:e_commerce/features/home/view_model/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.product,
    required this.index,
  });

  final ProductModel product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: CustomColors.light,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 15,
            right: 20,
            child: SizedBox(
              width: 131,
              height: 116,
              child: CustomCachedNetworkImage(imageUrl: product.imageUrl!),
            ),
          ),
          Positioned(
            right: 7.5,
            bottom: 19,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name!,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                    fontSize: 13,

                    letterSpacing: 0.0,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${product.price} جنية / ',
                      textAlign: TextAlign.right,
                      style: CustomFonts.cairoTextStyleBold_13orange500w700,
                    ),
                    Text(
                      'الكيلو',
                      textAlign: TextAlign.right,
                      style: CustomFonts.cairoTextStyleBold_13orange300w600,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 8.5,
            bottom: 16,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: CustomColors.green1_500,
                shape: BoxShape.circle,
              ),

              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(height: 16, width: 16, AssetsData.add),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                String currentAsset =
                    // state.[index]
                    //     ? AssetsData.redHeart
                    AssetsData.heart;

                return InkWell(
                  onTap: () {
                    // context.read<FavoriteCubit>().addRemoveToFavorite(index);
                  },
                  child: SvgPicture.asset(currentAsset, height: 25, width: 25),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
