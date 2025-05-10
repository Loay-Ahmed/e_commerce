import 'package:e_commerce/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNavBarIcon extends StatelessWidget {
  const CustomNavBarIcon({
    super.key,
    required this.active,
    required this.icon,
    required this.toggleActive,
    required this.index,
    required this.title,
  });
  final bool active;
  final IconData icon;
  final int index;
  final String title;
  final void Function(int) toggleActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toggleActive(index),
      child:
          active
              ? Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffeeeeee),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.green1_500,
                      ),
                      child: Icon(icon, color: Colors.white, size: 20),
                    ),
                    SizedBox(width: 5),
                    Text(
                      title,
                      style: GoogleFonts.cairo(
                        color: CustomColors.green1_500,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              )
              : SizedBox(
                width: 30,
                height: 30,
                child: Icon(icon, color: CustomColors.grey500, size: 20),
              ),
    );
  }
}
