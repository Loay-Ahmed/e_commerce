import 'dart:developer';

import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/cutom_circle_prog_indicator_for_social_button.dart';
import 'package:e_commerce/features/my_profile/data/model/user_model.dart';
import 'package:e_commerce/features/my_profile/presentation/widgets/custom_profile_avtar_picture.dart';
import 'package:e_commerce/features/my_profile/view_model/cubit/user_cubit.dart';
import 'package:e_commerce/features/product_review/data/models/comment_rate/comment_rate.dart';
import 'package:e_commerce/features/product_review/view_model/cubit/comment_rate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomWriteCommentWidget extends StatefulWidget {
  const CustomWriteCommentWidget({super.key, required this.productId});

  final String productId;

  @override
  State<CustomWriteCommentWidget> createState() =>
      _CustomWriteCommentWidgetState();
}

class _CustomWriteCommentWidgetState extends State<CustomWriteCommentWidget> {
  late final TextEditingController _commentController;

  @override
  void initState() {
    _commentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: CustomColors.grey70),
      ),
      child: Row(
        children: [
          BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if (state is GetUserDataSuccess) {
                log(context.read<UserCubit>().userDataModel!.image!);
              }
            },
            builder: (context, state) {
              UserCubit userCubit = context.read<UserCubit>();
              if (state is GetUserDataFailure || state is GetUserDataLoading) {
                return SizedBox(
                  height: 30,
                  width: 30,
                  child: Center(
                    child: CustomCircleProgIndicatorForSocialButton(),
                  ),
                );
              } else if (state is GetUserDataSuccess &&
                  userCubit.userDataModel?.image != null) {
                return CustomAvatarProfilePicture(
                  imageUrl: userCubit.userDataModel!.image!,
                  height: 30,
                  width: 30,
                );
              } else {
                return Image.asset(AssetsData.profileImage);
              }
            },
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: 'اكتب التعليق..',
                hintStyle: TextStyle(fontSize: 13, color: CustomColors.grey950),
                border: InputBorder.none,
              ),
              style: CustomFonts.cairoTextStyleBold_13grey400w400,
            ),
          ),
          BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              UserCubit userCubit = context.read<UserCubit>();
              return IconButton(
                onPressed: () async {
                  if (_commentController.text.isNotEmpty) {
                    // log("I'm Heeeeeeeeeeeeeeeeeeerrrrrrrrr");
                    CommentRateCubit commentRateCubit =
                        context.read<CommentRateCubit>();
                    await commentRateCubit.addComment(
                      data: CommentRateModel(
                        createdAt: DateTime.now(),
                        comment: _commentController.text.trim(),
                        forUser: commentRateCubit.userId,
                        forProduct: widget.productId,
                        rate: commentRateCubit.userRate,
                        users: UserModel(
                          image: userCubit.userDataModel?.image ?? '',
                          name: userCubit.userDataModel!.name,
                        ),
                      ),
                    );
                  }
                },
                icon: Icon(Icons.send_rounded),
              );
            },
          ),
        ],
      ),
    );
  }
}
