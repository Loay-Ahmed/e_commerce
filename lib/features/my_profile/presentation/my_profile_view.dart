import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/functions/navigate_to.dart';
import 'package:e_commerce/core/functions/navigate_to_with_cubit.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/favorite/presentation/favorite_view.dart';
import 'package:e_commerce/features/my_profile/presentation/personal_info_view.dart';
import 'package:e_commerce/features/my_profile/presentation/who_we_are_view.dart';
import 'package:e_commerce/features/my_profile/presentation/widgets/custom_forward_arrow.dart';
import 'package:e_commerce/features/my_profile/presentation/widgets/custom_profile_row_details.dart';
import 'package:e_commerce/features/my_profile/presentation/widgets/custom_sign_out_button.dart';
import 'package:e_commerce/features/my_profile/presentation/widgets/custom_toggle_switch_button.dart';
import 'package:e_commerce/features/my_profile/presentation/widgets/my_profile_main_info_widgte.dart';
import 'package:e_commerce/features/nav_bar/view_model/cubit/nav_bar_cubit.dart';
import 'package:e_commerce/features/trace_order/presentation/trace_order_my_profile_view.dart';
import 'package:flutter/material.dart';

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
                    onTap: () {
                      navigateTo(context, PersonalInfoView());
                    },
                    widget: CustomForwardArrow(),
                    image: AssetsData.person,
                    text: 'الملف الشخصى',
                  ),
                  CustomMyProfileRowDetails(
                    onTap: () {
                      // navigateToWithCubit<NavBarCubit, NavBarState>(
                      //   context: context,
                      //   widget: ,
                      // );
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
                    onTap: () {
                      navigateTo(context, FavoriteView());
                    },
                    widget: CustomForwardArrow(),
                    image: AssetsData.greenHeart,
                    text: 'المفضلة',
                  ),
                  CustomMyProfileRowDetails(
                    onTap: () {},
                    widget: CustomToggleSwitchButton(),
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
                    widget: CustomToggleSwitchButton(),
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
                    onTap: () {
                      navigateTo(context, WhoWeAreView());
                    },
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
