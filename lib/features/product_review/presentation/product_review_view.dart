import 'dart:developer';

import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/core/widgets/cutom_circle_prog_indicator_for_social_button.dart';
import 'package:e_commerce/features/my_profile/view_model/cubit/user_cubit.dart';
import 'package:e_commerce/features/product_review/data/models/comment_rate/comment_rate.dart';
import 'package:e_commerce/features/product_review/presentation/widgets/custom_comment_widget.dart';
import 'package:e_commerce/features/product_review/presentation/widgets/custom_rating_progress_bar.dart';
import 'package:e_commerce/features/product_review/presentation/widgets/custom_write_comment_widget.dart';
import 'package:e_commerce/features/product_review/view_model/cubit/comment_rate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class ProductReviewView extends StatefulWidget {
  const ProductReviewView({
    super.key,
    required this.productId,
    required this.reviewsNumber,
  });
  final String productId;
  final int reviewsNumber;

  @override
  State<ProductReviewView> createState() => _ProductReviewViewState();
}

class _ProductReviewViewState extends State<ProductReviewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: 'المراجعة', hasBell: false),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => UserCubit()..getUserData()),
            BlocProvider(
              create:
                  (context) =>
                      CommentRateCubit(reviewsNumber: widget.reviewsNumber)
                        ..getCommentsRates(productId: widget.productId),
            ),
          ],
          child: BlocConsumer<CommentRateCubit, CommentRateState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              CommentRateCubit commentRateCubit =
                  context.read<CommentRateCubit>();

              final bool isThereAnyComment =
                  commentRateCubit.commentsRatesList.isNotEmpty ? true : false;
              double avgRate =
                  isThereAnyComment
                      ? commentRateCubit.averageRate /
                          commentRateCubit.numberOfAverageRates
                      : 0;

              return state is GetCommentRateLoading ||
                      state is AddCommentLoading ||
                      state is AddOrUpdateRateLoading ||
                      state is UpdateNumberOfReviewsForProductLoading
                  ? CustomCircleProgIndicatorForSocialButton()
                  : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomWriteCommentWidget(productId: widget.productId),
                        SizedBox(height: 16),
                        Center(
                          child: RatingBar.builder(
                            initialRating: commentRateCubit.userRate.toDouble(),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            itemBuilder:
                                (context, _) => Icon(
                                  Icons.star,
                                  color: CustomColors.orangePrimaryColor,
                                ),
                            onRatingUpdate: (rating) {
                              commentRateCubit.addOrUpdateUserRate(
                                productId: widget.productId,
                                data: CommentRateModel(
                                  rate: rating.toInt(),
                                  forUser: commentRateCubit.userId,
                                  forProduct: widget.productId,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '${commentRateCubit.reviewsNumber} مراجعة',
                          style: CustomFonts.cairoTextStyleBold_13grey950w700,
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'الملخص',
                              style:
                                  CustomFonts.cairoTextStyleBold_16grey950w600,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(AssetsData.starRating),
                                SizedBox(width: 4),
                                Text(
                                  avgRate.toStringAsFixed(2),
                                  style:
                                      CustomFonts
                                          .cairoTextStyleBold_13grey950w700,
                                ),
                              ],
                            ),
                            Text(
                              '${isThereAnyComment ? ((avgRate / 5) * 100).toStringAsFixed(2) : 0}% موصى به',
                              style:
                                  CustomFonts.cairoTextStyleBold_13grey950w400,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        ...commentRateCubit.ratings.map(
                          (rating) => Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: RatingProgressBar(
                              rating: rating,
                              filledColor: CustomColors.orangePrimaryColor,
                              unfilledColor: CustomColors.gray100Transparent50,
                              barHeight: 10,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        if (isThereAnyComment)
                          ListView.builder(
                            itemCount:
                                commentRateCubit.commentsRatesList.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              log(
                                '${commentRateCubit.commentsRatesList[index].comment}===${commentRateCubit.commentsRatesList[index].users.toString()}======${commentRateCubit.commentsRatesList[index].rate}==========================================+++++++++',
                              );
                              return CustomCommentWidget(
                                commentRateModel:
                                    commentRateCubit.commentsRatesList[index],
                              );
                            },
                          ),
                        if (!isThereAnyComment)
                          Center(
                            child: Text(
                              'لا يوجد تعليقات',
                              style:
                                  CustomFonts.cairoTextStyleBold_16grey950w700,
                            ),
                          ),
                      ],
                    ),
                  );
            },
          ),
        ),
      ),
    );
  }
}
