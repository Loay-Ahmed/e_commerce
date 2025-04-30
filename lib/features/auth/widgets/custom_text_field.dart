import 'package:e_commerce/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.obscure,
    required this.hint,
    this.suffix,
    this.inputType,
    this.align = TextAlign.right,
  });

  final bool obscure;
  final String hint;
  final Widget? suffix;
  final TextInputType? inputType;
  final TextAlign align;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 342,
      child: TextField(
        controller: controller,
        keyboardType: inputType,
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
          hintText: hint,
          hintStyle: GoogleFonts.cairo(
            fontSize: 16,
            color: CustomColors.grey600,
            fontWeight: FontWeight.w600,
          ),
          suffixIcon: suffix,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
