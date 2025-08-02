import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/widgets/custom_grid_view_popular_products.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/home/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularProductsScreen extends StatelessWidget {
  const PopularProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: 'الأكثر مبيعا'),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text(
                'الأكثر مبيعا',
                style: CustomFonts.cairoTextStyleBold_19grey950w700,
              ),
              SizedBox(height: 8),

              CustomGridViewPopularProducts(
                products: context.read<HomeCubit>().products,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
