import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors.dart';

class CodeInputField extends StatelessWidget {
  const CodeInputField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 74,
      height: 60,
      child: TextField(
        controller: controller,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        cursorHeight: 0,
        maxLength: 1,
        keyboardType: TextInputType.number,
        style: GoogleFonts.cairo(fontSize: 23, fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          counterText: '',
          fillColor: CustomColors.black5,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: CustomColors.orange500),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: CustomColors.black10),
          ),
        ),
        onSubmitted: (value) {},
      ),
    );
  }
}
