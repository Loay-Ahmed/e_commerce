import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/features/my_profile/presentation/widgets/custom_profile_avtar_picture.dart';
import 'package:e_commerce/features/product_review/data/models/comment_rate/comment_rate.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCommentWidget extends StatelessWidget {
  const CustomCommentWidget({super.key, required this.commentRateModel});
  final CommentRateModel commentRateModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CustomAvatarProfilePicture(
                  imageUrl: commentRateModel.users?.image ?? '',
                  width: 58,
                  height: 58,
                ),
                Positioned(
                  bottom: -2,
                  left: -2,
                  child: Container(
                    // padding: EdgeInsets.all(3),
                    alignment: Alignment.center,
                    height: 20,
                    width: 21,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.5),
                      color: CustomColors.orangePrimaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.orangePrimaryColor,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                        // BoxShadow(
                        //   color: CustomColors.orangePrimaryColor,
                        //   blurRadius: 16,
                        //   offset: Offset(0, 4),
                        //   spreadRadius: 0,
                        // ),
                      ],
                    ),
                    child: Text(
                      '${commentRateModel.rate}',
                      style: CustomFonts.cairoTextStyleBold_11whitew600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  commentRateModel.users != null
                      ? commentRateModel.users?.name ?? 'ابلعو'
                      : 'null',
                  style: CustomFonts.cairoTextStyleBold_16grey950w600,
                ),
                Text(
                  DateFormat('dd/MM/yyyy').format(commentRateModel.createdAt!),
                  style: CustomFonts.cairoTextStyleBold_13grey400w400,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 17),
        Text(
          '${commentRateModel.comment}',
          style: CustomFonts.cairoTextStyleBold_13grey400w400,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
