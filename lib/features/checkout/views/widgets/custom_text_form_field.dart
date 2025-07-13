import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        color: CustomColors.black5,
        child: TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            // The hint text is what the user sees before they type anything.
            hintText: hintText,
            hintStyle: CustomFonts.cairoTextStyleBold_13grey400w700,
            // The border that is shown when the field is not focused.
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: CustomColors.black10, width: 1.0),
            ),
            // The border that is shown when the field is focused (being typed in).
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: CustomColors.green1_500, // A highlight color
                width: 2.0,
              ),
            ),
            // The border that is shown when there is a validation error.
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: CustomColors.red500, width: 1.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: CustomColors.red500, width: 2.0),
            ),
            // Padding inside the text field.
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 20,
            ),
            errorStyle: CustomFonts.cairoTextStyleBold_13red500,
          ),
        ),
      ),
    );
  }
}
