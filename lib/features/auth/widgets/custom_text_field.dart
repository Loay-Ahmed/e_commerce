import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.obscure,
    required this.hint,
    this.suffix,
    this.inputType,
    this.validator,
    this.align = TextAlign.right,
  });

  final bool obscure;
  final String hint;
  final Widget? suffix;
  final TextInputType? inputType;
  final TextAlign align;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.black5,

      height: 56,
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        validator: validator,
        textAlign: align,
        style:
            obscure
                ? TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.grey950,
                )
                : GoogleFonts.cairo(
                  fontSize: 16,
                  color: CustomColors.grey950,
                  fontWeight: FontWeight.w600,
                ),
        obscureText: obscure,
        obscuringCharacter: '●',
        decoration: InputDecoration(
          // The hint text is what the user sees before they type anything.
          hintText: hint,
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintStyle: CustomFonts.cairoTextStyleBold_13grey400w700,
          // The border that is shown when the field is not focused.
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: CustomColors.black10, width: 1.0),
          ),
          suffixIcon: suffix,
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
          // contentPadding: const EdgeInsets.symmetric(
          //   vertical: 15.0,
          //   horizontal: 20,
          // ),
          errorStyle: CustomFonts.cairoTextStyleBold_13red500,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
