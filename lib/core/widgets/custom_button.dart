import 'package:e_commerce/core/widgets/cutom_circle_prog_indicator_for_normal_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPress,
    this.isLoading = false,
  });

  final String text;
  final void Function()? onPress;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0XFF1B5E37),
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child:
          isLoading
              ? CustomCircleProgIndicatorForNormalButton()
              : Text(
                text,
                style: GoogleFonts.cairo(color: Colors.white, fontSize: 18),
              ),
    );
  }
}
