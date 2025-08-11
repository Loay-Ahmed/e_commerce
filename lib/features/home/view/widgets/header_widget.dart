import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/widgets/custom_notified_bell.dart';
import 'package:e_commerce/core/widgets/cutom_circle_prog_indicator_for_social_button.dart';
import 'package:e_commerce/features/my_profile/presentation/widgets/custom_profile_avtar_picture.dart';
import 'package:e_commerce/features/my_profile/view_model/cubit/user_cubit.dart';
import 'package:e_commerce/features/search/presentation/widgets/custom_search_bar_button.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getUserData(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          UserCubit userCubit = context.read<UserCubit>();
          return SizedBox(
            height: 110,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  // crossAxisAlignment in row is used to align children vertically
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child:
                          state is GetUserDataLoading
                              ? CustomCircleProgIndicatorForSocialButton()
                              : CustomAvatarProfilePicture(
                                imageUrl: userCubit.userDataModel?.image ?? '',
                                width: 44,
                                height: 44,
                              ),
                    ),

                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${S.of(context).good_morning} !..',
                          style: TextStyle(
                            fontFamily: 'cairo',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: CustomColors.grey400,
                          ),
                        ),
                        SizedBox(height: 4),
                        state is GetUserDataLoading
                            ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CustomCircleProgIndicatorForSocialButton(),
                            )
                            : Text(
                              userCubit.userDataModel?.name ?? 'ابلع',
                              style:
                                  CustomFonts.cairoTextStyleBold_16grey950w700,
                            ),
                      ],
                    ),
                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.all(8.0),

                      // child: CircleAvatar(
                      //   radius: 17,
                      //   backgroundColor: CustomColors.green50,
                      //   child: SvgPicture.asset(AssetsData.bell, width: 20, height: 20),
                      // ),
                      child: CustomNotifiedBell(),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                CustomSearchBarButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
