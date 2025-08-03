import 'package:e_commerce/core/functions/navigate_without_back.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/custom_back_arrow.dart';
import 'package:e_commerce/core/widgets/custom_cached_network_image.dart';
import 'package:e_commerce/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:e_commerce/features/home/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:e_commerce/features/nav_bar/presentation/main_home_view.dart';
import 'package:e_commerce/features/nav_bar/view_model/cubit/nav_bar_cubit.dart';

import 'package:e_commerce/features/product_Details/view/widgets/product_feature_grid.dart';
import 'package:e_commerce/features/product_Details/view/widgets/product_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              CartCubit(products: context.read<HomeCubit>().products)
                ..getProductsCart(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: CustomClipPath(),
                      child: Container(
                        height: 350,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AssetsData.backgroundDetails),
                            fit: BoxFit.cover,
                          ),
                        ),
                        //  color: Colors.black.,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomBackArrow(),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Placeholder(
                                fallbackHeight: 180,
                                color: Colors.transparent,
                                child: SizedBox(
                                  height: 167,
                                  width: 221,
                                  child: CustomCachedNetworkImage(
                                    imageUrl: product.imageUrl!,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8,
                  ),
                  child: ProductInfoWidget(product: product),
                ),

                ProductFeatureGrid(product: product),

                BlocConsumer<CartCubit, CartState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    CartCubit cartCubit = context.read<CartCubit>();
                    int cubitQuantity = cartCubit
                        .getProductQuantityInCartIfExist(product.id!);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomButton(
                        text:
                            cubitQuantity == 0
                                ? "أضف الي السلة"
                                : "اذهب الى العربة",
                        onPress: () async {
                          if (cubitQuantity == 0) {
                            await cartCubit.addProductToCart(
                              product.id!,
                              cartCubit.dummyQuantity,
                            );
                            cartCubit.initDummyQuantityValue();
                            Navigator.of(context).pop();
                          } else {
                            context.read<NavBarCubit>().changeCurrentIndex(2);
                            navigateWithoutBack(context, MainHomeView());
                          }
                        },
                        isLoading:
                            state is AddToCartLoading ||
                                    state is GetProductsCartLoading?
                                ? true
                                : false,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
