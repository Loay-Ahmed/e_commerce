import 'package:e_commerce/core/colors.dart';
import 'package:flutter/material.dart';

class CustomCircleProgIndicatorForSocialButton extends StatelessWidget {
  const CustomCircleProgIndicatorForSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: CustomColors.grey950),
    );
  }
}
