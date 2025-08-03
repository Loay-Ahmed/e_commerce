import 'dart:developer';

import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/cutom_circle_prog_indicator_for_social_button.dart';
import 'package:e_commerce/features/my_profile/presentation/widgets/custom_profile_avtar_picture.dart';
import 'package:e_commerce/features/my_profile/view_model/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MyProfileMainInfoWidget extends StatelessWidget {
  const MyProfileMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..getUserData(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UpdateUserPictureSuccess) {
            log(context.read<UserCubit>().userDataModel!.image.toString());
          }
        },
        builder: (context, state) {
          UserCubit userCubit = context.read<UserCubit>();
          return state is GetUserDataLoading ||
                  state is UpdateUserPictureLoading
              ? CustomCircleProgIndicatorForSocialButton()
              : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CustomAvatarProfilePicture(
                        imageUrl: userCubit.userDataModel?.image ?? '',
                        width: 80,
                        height: 80,
                      ),
                      Positioned(
                        bottom: -20,
                        left: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () async {
                            await userCubit.takePicture();
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),

                            child: Container(
                              width: 32,
                              height: 32,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomColors.light,
                              ),
                              child: SvgPicture.asset(
                                height: 22,
                                width: 22,
                                AssetsData.camera,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userCubit.userDataModel!.name!,
                        style: CustomFonts.cairoTextStyleBold_13grey950w700,
                      ),
                      Text(
                        userCubit.userDataModel!.email!,
                        style: CustomFonts.cairoTextStyleBold_13grey400w400,
                      ),
                    ],
                  ),
                ],
              );
        },
      ),
    );
  }
}
