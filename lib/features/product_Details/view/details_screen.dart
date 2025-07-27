import 'package:e_commerce/core/widgets/custom_back_arrow.dart';
import 'package:e_commerce/core/widgets/custom_cached_network_image.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';

import 'package:e_commerce/features/product_Details/view/widgets/product_feature_grid.dart';
import 'package:e_commerce/features/product_Details/view/widgets/product_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/colors.dart';

import '../../../core/widgets/custom_button.dart';
import '../../auth/widgets/custom_app_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          image: AssetImage(
                            'assets/images/background_details.png',
                          ),
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(text: "أضف الي السلة", onPress: () {}),
              ),
              SizedBox(height: 20),
            ],
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
