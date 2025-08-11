import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/functions/navigate_to.dart';

import 'package:e_commerce/core/widgets/custom_grid_view_popular_products.dart';
import 'package:e_commerce/core/widgets/cutom_circle_prog_indicator_for_social_button.dart';

import 'package:e_commerce/features/home/view/popular_products_screen.dart';
import 'package:e_commerce/features/home/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularProductsWidget extends StatelessWidget {
  const PopularProductsWidget({super.key});

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
                S.of(context).best_selling,
                style: CustomFonts.cairoTextStyleBold_16grey950w700,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const PopularProductsScreen(),
                  //   ),
                  // );
                  navigateTo(context, PopularProductsScreen());
                },
                child: Text(
                  S.of(context).more,
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
        // isProductsWidget
        //     ? BlocConsumer<HomeCubit, HomeState>(
        //       listener: (context, state) {
        //         // TODO: implement listener
        //       },
        //       builder: (context, state) {
        //         HomeCubit homeCubit = context.read<HomeCubit>();
        //         return Expanded(
        //           child:
        //               state is GetProductsLoading
        //                   ? CustomCircleProgIndicatorForSocialButton()
        //                   : CustomGridViewPopularProducts(
        //                     scrollPhysics: false,
        //                     shrinkWrap: false,
        //                     products: homeCubit.products,
        //                   ),
        //         );
        //       },
        //     )
        BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            HomeCubit homeCubit = context.read<HomeCubit>();
            return state is GetProductsLoading
                ? CustomCircleProgIndicatorForSocialButton()
                : CustomGridViewPopularProducts(products: homeCubit.products);
          },
        ),
      ],
    );
  }
}
