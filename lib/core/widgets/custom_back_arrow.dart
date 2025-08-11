import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/features/notifications/view_model/view_model/cubit/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomBackArrow extends StatelessWidget {
  const CustomBackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    final isRTL = context.read<NotificationCubit>().notificationsEnabled;
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black, // border color
            width: 0.08, // border width
          ),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 22,
          child: Transform.scale(
            scaleX: isRTL ? 1 : -1,
            child: SvgPicture.asset(AssetsData.backArrow),
          ),
        ),
      ),
    );
  }
}
