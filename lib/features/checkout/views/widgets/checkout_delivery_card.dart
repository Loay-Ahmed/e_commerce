import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:flutter/material.dart';

class CheckoutDeliveryCard extends StatelessWidget {
  const CheckoutDeliveryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.priceText,
    required this.isSelected,
  });
  final String title;
  final String subtitle;
  final String priceText;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = CustomColors.green1_500;
    final Color unselectedColor = CustomColors.grey;

    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: CustomColors.grey,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          // Change border color based on selection state.
          color: isSelected ? selectedColor : unselectedColor,
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? selectedColor : CustomColors.grey400,
                    width: 1.5,
                  ),
                ),
                child:
                    isSelected
                        ? Center(
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedColor,
                            ),
                          ),
                        )
                        : null,
              ),
              SizedBox(width: 10),
              // Middle: Title and Subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: CustomFonts.cairoTextStyleBold_13grey950w600,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: CustomFonts.cairoTextStyleBold_13grey700,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 19,
            bottom: 19,
            left: 0,
            child: Text(
              priceText,
              style: CustomFonts.cairoTextStyleBold_13green800,
            ),
          ),
        ],
      ),
    );
  }
}
