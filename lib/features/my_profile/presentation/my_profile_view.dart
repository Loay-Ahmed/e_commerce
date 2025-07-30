import 'dart:io';

import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/functions/navigate_to.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/core/widgets/custom_nav_bar.dart';
import 'package:e_commerce/features/my_profile/presentation/widgets/custom_forward_arrow.dart';
import 'package:e_commerce/features/my_profile/presentation/widgets/my_profile_main_info_widgte.dart';
import 'package:e_commerce/features/trace_order/presentation/trace_order_my_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: 'حسابى', hasBackArrow: false, hasBell: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyProfileMainInfoWidget(),
                  SizedBox(height: 30),
                  Text(
                    'عام',
                    style: CustomFonts.cairoTextStyleBold_13grey950w600,
                  ),
                  SizedBox(height: 30),
                  CustomMyProfileRowDetails(
                    onTap: () {},
                    widget: CustomForwardArrow(),
                    image: AssetsData.person,
                    text: 'الملف الشخصى',
                  ),
                  CustomMyProfileRowDetails(
                    onTap: () {
                      navigateTo(context, TraceOrderMyProfileView());
                    },
                    widget: CustomForwardArrow(),
                    image: AssetsData.box,
                    text: 'طلباتى',
                  ),
                  CustomMyProfileRowDetails(
                    onTap: () {},
                    widget: CustomForwardArrow(),
                    image: AssetsData.wallet,
                    text: 'المدفوعات',
                  ),
                  CustomMyProfileRowDetails(
                    onTap: () {},
                    widget: CustomForwardArrow(),
                    image: AssetsData.greenHeart,
                    text: 'المفضلة',
                  ),
                  CustomMyProfileRowDetails(
                    onTap: () {},
                    widget: CustomForwardArrow(),
                    image: AssetsData.bell,
                    text: 'الاشعارات',
                  ),
                  CustomMyProfileRowDetails(
                    onTap: () {},
                    widget: CustomForwardArrow(),
                    isLanguageRow: true,
                    image: AssetsData.global,
                    text: 'اللغة',
                  ),
                  CustomMyProfileRowDetails(
                    onTap: () {},
                    widget: CustomForwardArrow(),
                    image: AssetsData.magicPen,
                    text: 'الوضع',
                  ),
                  SizedBox(height: 22),
                  Text(
                    'المساعدة',
                    style: CustomFonts.cairoTextStyleBold_13grey950w600,
                  ),
                  SizedBox(height: 16),
                  CustomMyProfileRowDetails(
                    onTap: () {},
                    widget: CustomForwardArrow(),
                    image: AssetsData.infoCircle,
                    text: 'من نحن',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CustomSignOutButton(),
          ],
        ),
      ),
    );
  }
}

class CustomSignOutButton extends StatelessWidget {
  const CustomSignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      width: double.infinity,
      alignment: Alignment.center,
      color: CustomColors.green1_50,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'تسجيل الخروج',
            style: CustomFonts.cairoTextStyleBold_13green1_500w600,
          ),
          SizedBox(width: 30),
          SvgPicture.asset(AssetsData.logout),
        ],
      ),
    );
  }
}

class CustomMyProfileRowDetails extends StatelessWidget {
  const CustomMyProfileRowDetails({
    super.key,
    required this.image,
    required this.text,
    required this.widget,
    required this.onTap,
    this.isLanguageRow = false,
  });

  final String image;
  final String text;
  final Widget widget;
  final void Function() onTap;
  final bool isLanguageRow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Row(
            children: [
              SvgPicture.asset(image),
              SizedBox(width: 7),
              Text(text, style: CustomFonts.cairoTextStyleBold_13grey400w600),
              Spacer(),
              if (isLanguageRow)
                Text(
                  'العربية',
                  style: CustomFonts.cairoTextStyleBold_13grey950w400,
                ),
              widget,
            ],
          ),
        ),
        Divider(height: 25, thickness: 0.2),
      ],
    );
  }
}
