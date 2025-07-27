import 'package:e_commerce/core/functions/navigate_to.dart';
import 'package:e_commerce/core/widgets/cutom_circle_prog_indicator_for_social_button.dart';
import 'package:e_commerce/core/widgets/product_card_widget.dart';
import 'package:e_commerce/features/home/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:e_commerce/features/product_Details/view/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomGridViewPopularProducts extends StatelessWidget {
  const CustomGridViewPopularProducts({
    super.key,
    this.shrinkWrap = true,
    this.scrollPhysics = true,
  });

  final bool shrinkWrap;
  final bool scrollPhysics;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit homeCubit = context.read<HomeCubit>();

          return state is GetProductsLoading
              ? CustomCircleProgIndicatorForSocialButton()
              : GridView.builder(
                padding: const EdgeInsets.only(top: 0),
                itemCount: homeCubit.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                // shrinkWrap and physics are very important when using GridView.builder (or ListView) inside another scrollable widget like a Column or SingleChildScrollView.
                // shrinkWrap tells the GridView to only take up as much vertical space as its children need.
                // without shrinkWrap: true, GridView tries to take infinite height, which causes layout errors
                shrinkWrap: shrinkWrap,
                // physics, It disables internal scrolling of the GridView.
                // Don't scroll this grid — let the parent scroll view handle scrolling.
                physics:
                    scrollPhysics
                        ? NeverScrollableScrollPhysics()
                        : BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      navigateTo(
                        context,
                        ProductDetailsScreen(
                          product: homeCubit.products[index],
                        ),
                      );
                    },
                    child: ProductCardWidget(
                      product: homeCubit.products[index],
                      index: index,
                    ),
                  );
                },
              );
        },
      ),
    );
  }
}
