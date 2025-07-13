import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:flutter/material.dart';

class CustomDeliveryButton extends StatelessWidget {
  const CustomDeliveryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
  });

  final String title;
  final void Function() onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.green1_500,
        minimumSize: const Size(double.infinity, 54),
      ),

      child:
          isLoading
              ? CircularProgressIndicator(color: CustomColors.light)
              : Text(title, style: CustomFonts.cairoTextStyleBold_17),
    );
  }
}
