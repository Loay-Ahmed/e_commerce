import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/features/cart/view_model/cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:e_commerce/features/home/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:e_commerce/features/product_Details/view/widgets/custom_product_quantity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name!,
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: CustomColors.grey950,
                  ),
                  textAlign: TextAlign.right,
                ),
                CustomProductQuantity(productId: product.id!),
              ],
            ),
            SizedBox(height: 4),
            Text(
              "${product.price} جنية / الكيلو",
              style: GoogleFonts.cairo(color: Colors.orange, fontSize: 16),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 18),
                SizedBox(width: 8),
                Text(
                  // TODO: you should remove reviewsRate and add the normal rate
                  "${product.reviewsRate}",
                  style: GoogleFonts.cairo(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "  (30+)",
                  style: GoogleFonts.cairo(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "المراجعة",
                  style: GoogleFonts.cairo(
                    color: CustomColors.green1_500,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              "${product.name} ينتمي إلى الفصيلة القرعية ويشتهر بأنه حلو المذاق...",
              style: GoogleFonts.cairo(
                color: CustomColors.lightGrey,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        );
      },
    );
  }
}
