import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_cached_network_image.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/product_Details/view/widgets/custom_product_quantity.dart';
import 'package:flutter/material.dart';
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

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            height: 41,
            color: CustomColors.green1_50,

            child: Text(
              'لديك $num منتجات فى سلة التسوق',
              style: CustomFonts.cairoTextStyleBold_13green1_500w400,
            ),
          ),
          SizedBox(height: 24),

          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return CustomCardInCartView(index: index);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: CustomButton(text: 'الدفع', onPress: () {}),
          ),
        ],
      ),
    );
  }
}

class CustomCardInCartView extends StatelessWidget {
  const CustomCardInCartView({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
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
                  child: CustomCachedNetworkImage(
                    imageUrl:
                        'https://github.com/Sharawelly/Images/blob/main/water_malon.png?raw=true',
                  ),
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
                      'بطيخ',
                      style: CustomFonts.cairoTextStyleBold_13grey950w700,
                    ),
                    Text(
                      '3 كم',
                      style: CustomFonts.cairoTextStyleBold_13orange300w600,
                    ),
                    CustomProductQuantity(isSmall: true),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      FontAwesomeIcons.trashCan,
                      color: CustomColors.grey400,
                      size: 20,
                    ),
                    Text(
                      '60 جنيه',
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
