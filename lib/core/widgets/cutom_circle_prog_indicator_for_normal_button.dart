import 'package:e_commerce/core/colors.dart';
import 'package:flutter/material.dart';

class CustomCircleProgIndicatorForNormalButton extends StatelessWidget {
  const CustomCircleProgIndicatorForNormalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: CustomColors.light));
  }
}
