import 'package:e_commerce/core/colors.dart';
import 'package:flutter/material.dart';

class CustomToggleSwitchButton extends StatelessWidget {
  const CustomToggleSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: 32,
      height: 17,
      decoration: BoxDecoration(
        color: CustomColors.grey300,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Padding(
        padding: const EdgeInsets.only(right: 1),
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
