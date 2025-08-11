import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/custom_grid_view_popular_products.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/core/widgets/custom_nav_bar.dart';
import 'package:e_commerce/core/widgets/cutom_circle_prog_indicator_for_social_button.dart';
import 'package:e_commerce/features/favorite/view_model/favorite_cubit/favorite_cubit.dart';
import 'package:e_commerce/features/home/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:e_commerce/features/nav_bar/presentation/main_home_view.dart';
import 'package:e_commerce/features/nav_bar/view_model/cubit/nav_bar_cubit.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        NavBarCubit navBarCubit = context.read<NavBarCubit>();

        if (navBarCubit.currentIndex != 3) {
          navBarCubit.changeCurrentIndex(
            navBarCubit.currentIndex,
          ); // fix to index 3
          return MainHomeView(); // navigate to main home view
        }
        return Scaffold(
          appBar: CustomHeader(title: S.of(context).favorites, hasBell: false),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: BlocProvider(
                create:
                    (context) => FavoriteCubit(
                      products: context.read<HomeCubit>().products,
                    )..getFavoriteProducts(),
                child: BlocConsumer<FavoriteCubit, FavoriteState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    FavoriteCubit favoriteCubit = context.read<FavoriteCubit>();
                    return state is GetFavoriteProductsLoading
                        ? CustomCircleProgIndicatorForSocialButton()
                        : state is GetFavoriteProductsSuccess &&
                            favoriteCubit.favoriteProducts.isEmpty
                        ? Center(
                          child: Image.asset(
                            height: 250,
                            width: 250,
                            AssetsData.emptyFavoriteProducts,
                          ),
                        )
                        : CustomGridViewPopularProducts(
                          // scrollPhysics: false,
                          // shrinkWrap: false,
                          products: favoriteCubit.favoriteProducts,
                        );
                  },
                ),
              ),
            ),
          ),
          bottomNavigationBar: CustomNavBar(),
        );
      },
    );
  }
}
