import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/features/nav_bar/view_model/cubit/nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNavBarIcon extends StatelessWidget {
  const CustomNavBarIcon({
    super.key,

    required this.icon,

    required this.index,
    required this.title,
  });

  final IconData icon;
  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    NavBarCubit cubit = context.read<NavBarCubit>();

    return GestureDetector(
      onTap: () {
        cubit.changeCurrentIndex(index);
      },
      child:
          cubit.currentIndex == index
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
