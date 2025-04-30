import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MixTextButton extends StatelessWidget {
  const MixTextButton({
    super.key,
    required this.text1,
    required this.text2,
    this.onPress,
  });

  final String text1;
  final String text2;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onPress,
        child: Text.rich(
          TextSpan(
            text: text1,
            style: GoogleFonts.cairo(color: Colors.black),
            children: [
              TextSpan(
                text: text2,
                style: GoogleFonts.cairo(color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
