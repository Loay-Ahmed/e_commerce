import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomProductQuantity extends StatelessWidget {
  const CustomProductQuantity({
    super.key,
    this.isSmall = false,
    required this.productId,
  });

  final bool isSmall;
  final String productId;

  @override
  Widget build(BuildContext context) {
    final double width = isSmall ? 28 : 40;
    final double height = isSmall ? 14 : 16;
    int quantity = 1;
    CartCubit cartCubit = context.read<CartCubit>();
    int cubitQuantity = cartCubit.getProductQuantityInCartIfExist(productId);
    return !isSmall && cubitQuantity != 0
        ? Text(
          'مضاف مسبقا\nالكمية: $cubitQuantity',
          style: CustomFonts.cairoTextStyleBold_13grey950w600,
        )
        : Row(
          children: [
            Container(
              width: width,
              height: width,
              decoration: BoxDecoration(
                color: CustomColors.green1_500,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Image.asset(
                  AssetsData.plus,
                  width: height,
                  height: height,
                  // color: Colors.white,
                ),
                onPressed: () async {
                  {
                    quantity++;
                    cartCubit.increaseDummyQuantity();
                    await cartCubit.increaseQuantity(productId);
                  }
                },
              ),
            ),
            SizedBox(width: 16),
            BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Text(
                  cubitQuantity == 0
                      ? quantity.toString()
                      : cubitQuantity.toString(),
                  style: GoogleFonts.cairo(fontSize: height),
                );
              },
            ),
            SizedBox(width: 16),
            Container(
              width: width,
              height: width,
              decoration: BoxDecoration(
                color: Color(0xffF3F5F7),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Image.asset(
                  AssetsData.minus,
                  width: height,
                  height: height,
                  // color,
                ),
                onPressed: () async {
                  await cartCubit.decreaseQuantity(productId);

                  if (quantity > 1) {
                    quantity--;
                    cartCubit.decreaseDummyQuantity();
                  }
                },
              ),
            ),
          ],
        );
  }
}
