import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/widgets/cutom_circle_prog_indicator_for_social_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.isLoading = false,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 340,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? CustomCircleProgIndicatorForSocialButton()
                : Text(
                  text,
                  style: GoogleFonts.cairo(
                    color: CustomColors.grey950,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
          ],
        ),
        style: OutlinedButton.styleFrom(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20, left: 54),
          side: const BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
