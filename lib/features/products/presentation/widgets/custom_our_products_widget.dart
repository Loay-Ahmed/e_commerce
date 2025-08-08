import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/widgets/custom_cached_network_image.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:e_commerce/features/home/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomOurProductsWidget extends StatelessWidget {
  const CustomOurProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final List<ProductModel> products = context.read<HomeCubit>().products;
        return SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColors.light,
                        ),
                        child: CustomCachedNetworkImage(
                          imageUrl: products[index].imageUrl!,
                        ),
                      ),
                      Text(
                        products[index].name!,
                        style: CustomFonts.cairoTextStyleBold_13grey950w600,
                      ),
                    ],
                  ),
                  if (index != products.length - 1) SizedBox(width: 13),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
