import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_cached_network_image.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/core/widgets/cutom_circle_prog_indicator_for_social_button.dart';
import 'package:e_commerce/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:e_commerce/features/home/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:e_commerce/features/product_Details/view/widgets/custom_product_quantity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  final num = 3;

  @override
  Widget build(BuildContext context) {
    final double cartHeight = MediaQuery.of(context).size.height;
    final List<String> list = ["vvv", "hello"];
    return Scaffold(
      appBar: CustomHeader(title: 'السلة', hasBell: false, hasBackArrow: false),

      body: BlocProvider(
        create:
            (context) =>
                CartCubit(products: context.read<HomeCubit>().products)
                  ..getProductsCart(),
        child: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            CartCubit cartCubit = context.read<CartCubit>();
            return state is GetProductsCartLoading
                ? CustomCircleProgIndicatorForSocialButton()
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 41,
                      color: CustomColors.green1_50,

                      child: Text(
                        'لديك ${cartCubit.cartProducts.length} منتجات فى سلة التسوق',
                        style: CustomFonts.cairoTextStyleBold_13green1_500w400,
                      ),
                    ),
                    SizedBox(height: 24),

                    Expanded(
                      child: ListView.builder(
                        itemCount: cartCubit.cartProducts.length,
                        itemBuilder: (context, index) {
                          return CustomCardInCartView(
                            index: index,
                            product: cartCubit.cartProducts[index],
                            cartCubit: cartCubit,
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 40,
                      ),
                      child: CustomButton(text: 'الدفع', onPress: () {}),
                    ),
                  ],
                );
          },
        ),
      ),
    );
  }
}

class CustomCardInCartView extends StatelessWidget {
  const CustomCardInCartView({
    super.key,
    required this.index,
    required this.product,
    required this.cartCubit,
  });

  final ProductModel product;
  final int index;
  final CartCubit cartCubit;

  @override
  Widget build(BuildContext context) {
    final quantity = cartCubit.getProductQuantityInCartIfExist(product.id);
    int total = int.parse(product.price!) * (quantity == 0 ? 1 : quantity);
    return Column(
      children: [
        if (index == 0)
          Divider(height: 0.2, thickness: 0.2, color: Colors.grey),
        Container(
          height: 95,
          padding: EdgeInsets.symmetric(horizontal: 17.5),

          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Container(
                  height: 95,
                  padding: EdgeInsets.symmetric(vertical: 26, horizontal: 10),
                  color: CustomColors.light,
                  width: 73,
                  child: CustomCachedNetworkImage(imageUrl: product.imageUrl!),
                ),
              ),
              SizedBox(width: 17),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name!,
                      style: CustomFonts.cairoTextStyleBold_13grey950w700,
                    ),
                    Text(
                      quantity == 0 ? '1 كيلو' : '${quantity.toString()} كيلو',
                      style: CustomFonts.cairoTextStyleBold_13orange300w600,
                    ),
                    CustomProductQuantity(
                      isSmall: true,
                      productId: product.id!,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        cartCubit.removeProductFromCart(product.id!);
                      },
                      child: Icon(
                        FontAwesomeIcons.trashCan,
                        color: CustomColors.grey400,
                        size: 20,
                      ),
                    ),
                    Text(
                      '${total.toString()} جنية',
                      style: CustomFonts.cairoTextStyleBold_13orange500w700,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(height: 0.2, thickness: 0.2, color: Colors.grey),
      ],
    );
  }
}
