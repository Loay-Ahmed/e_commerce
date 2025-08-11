import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/functions/navigate_to.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/favorite/presentation/favorite_view.dart';
import 'package:e_commerce/features/localization/cubit/localization_cubit.dart';
import 'package:e_commerce/features/my_profile/presentation/personal_info_view.dart';
import 'package:e_commerce/features/my_profile/presentation/who_we_are_view.dart';
import 'package:e_commerce/features/my_profile/presentation/widgets/custom_forward_arrow.dart';
import 'package:e_commerce/features/my_profile/presentation/widgets/custom_profile_row_details.dart';
import 'package:e_commerce/features/my_profile/presentation/widgets/custom_sign_out_button.dart';
import 'package:e_commerce/features/my_profile/presentation/widgets/custom_toggle_switch_button.dart';
import 'package:e_commerce/features/my_profile/presentation/widgets/my_profile_main_info_widgte.dart';
import 'package:e_commerce/features/notifications/view_model/view_model/cubit/notification_cubit.dart';
import 'package:e_commerce/features/notifications/view_model/view_model/cubit/notification_state.dart';
import 'package:e_commerce/features/trace_order/presentation/trace_order_my_profile_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isRTL = context.read<LocalizationCubit>().isRTL();
    return Scaffold(
      appBar: CustomHeader(
        title: S.of(context).profile,
        hasBackArrow: false,
        hasBell: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
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
                    widget: CustomForwardArrow(isArabic: isRTL),
                    image: AssetsData.person,
                    text: S.of(context).nav_bar_my_profile,
                  ),
                  CustomMyProfileRowDetails(
                    onTap: () {
                      // navigateToWithCubit<NavBarCubit, NavBarState>(
                      //   context: context,
                      //   widget: ,
                      // );
                      navigateTo(context, TraceOrderMyProfileView());
                    },
                    widget: CustomForwardArrow(isArabic: isRTL),
                    image: AssetsData.box,
                    text: S.of(context).my_orders,
                  ),
                  CustomMyProfileRowDetails(
                    onTap: () {},
                    widget: CustomForwardArrow(isArabic: isRTL),
                    image: AssetsData.wallet,
                    text: S.of(context).payments,
                  ),
                  CustomMyProfileRowDetails(
                    onTap: () {
                      navigateTo(context, FavoriteView());
                    },
                    widget: CustomForwardArrow(isArabic: isRTL),
                    image: AssetsData.greenHeart,
                    text: S.of(context).favorites,
                  ),
                  CustomMyProfileRowDetails(
                    onTap: () {
                      context.read<NotificationCubit>().toggleNotifications();
                    },
                    widget: BlocConsumer<NotificationCubit, NotificationState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return CustomToggleSwitchButton(
                          isActive:
                              context
                                  .read<NotificationCubit>()
                                  .isNotificationEnabled(),
                        );
                      },
                    ),
                    image: AssetsData.bell,
                    text: S.of(context).notifications,
                  ),
                  CustomMyProfileRowDetails(
                    onTap: () {
                      context.read<LocalizationCubit>().toggleLanguage();
                    },
                    widget: CustomForwardArrow(isArabic: isRTL),
                    isLanguageRow: true,
                    image: AssetsData.global,
                    text: S.of(context).language_text,
                  ),
                  CustomMyProfileRowDetails(
                    onTap: () {},
                    widget: CustomToggleSwitchButton(isActive: false),
                    image: AssetsData.magicPen,
                    text: S.of(context).status,
                  ),
                  SizedBox(height: 22),
                  Text(
                    S.of(context).help,
                    style: CustomFonts.cairoTextStyleBold_13grey950w600,
                  ),
                  SizedBox(height: 16),
                  CustomMyProfileRowDetails(
                    onTap: () {
                      navigateTo(context, WhoWeAreView());
                    },
                    widget: CustomForwardArrow(isArabic: isRTL),
                    image: AssetsData.infoCircle,
                    text: S.of(context).about_us,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CustomSignOutButton(isRTL: isRTL),
          ],
        ),
      ),
    );
  }
}
