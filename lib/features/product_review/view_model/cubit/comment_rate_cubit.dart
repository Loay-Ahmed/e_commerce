import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/data/services/api_services.dart';
import 'package:e_commerce/features/product_review/data/models/comment_rate/comment_rate.dart';
import 'package:e_commerce/features/product_review/presentation/widgets/custom_rating_progress_bar.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'comment_rate_state.dart';

class CommentRateCubit extends Cubit<CommentRateState> {
  CommentRateCubit({required this.reviewsNumber}) : super(CommentRateInitial());
  final ApiServices _apiServices = ApiServices();
  String userId = Supabase.instance.client.auth.currentUser!.id;

  List<CommentRateModel> commentsRatesList = [];
  double averageRate = 0;
  int numberOfAverageRates = 0;
  int userRate = 5;
  bool isUserHasRate = false;
  String rowId = '';
  int reviewsNumber;

  final List<RatingData> ratings = [
    RatingData(stars: 5, percentage: 0, numberOfStars: 0),
    RatingData(stars: 4, percentage: 0, numberOfStars: 0),
    RatingData(stars: 3, percentage: 0, numberOfStars: 0),
    RatingData(stars: 2, percentage: 0, numberOfStars: 0),
    RatingData(stars: 1, percentage: 0, numberOfStars: 0),
  ];

  void increaseRatingPercentage(int number) {
    switch (number) {
      case 1:
        ratings[4].numberOfStars++; // 1 star
        break;
      case 2:
        ratings[3].numberOfStars++; // 2 stars
        break;
      case 3:
        ratings[2].numberOfStars++; // 3 stars
        break;
      case 4:
        ratings[1].numberOfStars++; // 4 stars
        break;
      case 5:
        ratings[0].numberOfStars++; // 5 stars
        break;
      default:
        print('Invalid star rating: $number');
    }
  }

  void _divideRatingToGetPercentage() {
    ratings[0].percentage =
        ratings[0].numberOfStars /
        (commentsRatesList.isEmpty ? 1 : commentsRatesList.length);
    ratings[1].percentage =
        ratings[1].numberOfStars /
        (commentsRatesList.isEmpty ? 1 : commentsRatesList.length);
    ratings[2].percentage =
        ratings[2].numberOfStars /
        (commentsRatesList.isEmpty ? 1 : commentsRatesList.length);
    ratings[3].percentage =
        ratings[3].numberOfStars /
        (commentsRatesList.isEmpty ? 1 : commentsRatesList.length);
    ratings[4].percentage =
        ratings[4].numberOfStars /
        (commentsRatesList.isEmpty ? 1 : commentsRatesList.length);
  }

  Future<void> getCommentsRates({required String productId}) async {
    emit(GetCommentRateLoading());
    commentsRatesList = [];
    try {
      Response response = await _apiServices.getData(
        "comments_rates_table?select=*,users(*)&for_product=eq.$productId",
      );
      for (var rate in response.data) {
        commentsRatesList.add(CommentRateModel.fromJson(rate));
        CommentRateModel last = commentsRatesList.last;
        if (last.forUser == userId &&
            last.rate != null &&
            !isUserHasRate &&
            last.comment == null) {
          userRate = last.rate!;
          isUserHasRate = true;
          rowId = last.id!;
        }

        averageRate += last.rate!;
        numberOfAverageRates++;
        increaseRatingPercentage(last.rate!);
      }

      _divideRatingToGetPercentage();

      // log('${commentsRatesList[0].comment} ################################');
      // log(userRate.toString());
      // _getAverageRate();
      // _getUserRate();
      emit(GetCommentRateSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetCommentRateError());
    }
  }

  Future<void> addOrUpdateUserRate({
    required String productId,
    required CommentRateModel data,
  }) async {
    // user rate exist ==> update for user rate
    // user doesn't exist ==> add rate
    String path =
        "comments_rates_table?select=*&for_user=eq.$userId&for_product=eq.$productId";
    emit(AddOrUpdateRateLoading());

    try {
      if (isUserHasRate) {
        // user rate exist ==> update for user rate

        path += "&id=eq.$rowId";
        await _apiServices.patchData(path, data.toJson());
        userRate = data.rate!;
      } else {
        await _apiServices.postData(path, data.toJson());
        await _getLastUserRate(productId);
      }

      emit(AddOrUpdateRateSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddOrUpdateRateError());
    }
  }

  Future<void> _getLastUserRate(String productId) async {
    try {
      final response = await _apiServices.getData(
        'comments_rates_table?select=*&for_product=eq.$productId&for_user=eq.$userId&order=created_at.desc&limit=1',
      );

      if (response.data is List && (response.data as List).isNotEmpty) {
        final json = (response.data as List)[0];
        final lastCommentRate = CommentRateModel.fromJson(json);

        userRate = lastCommentRate.rate!;
        isUserHasRate = true;
        rowId = lastCommentRate.id!;

        log('Retrieved inserted rate - Rate: $userRate, RowId: $rowId');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> addComment({required CommentRateModel data}) async {
    emit(AddCommentLoading());
    try {
      if (isUserHasRate) {
        await _apiServices.patchData(
          'comments_rates_table?select=*&id=eq.$rowId',
          data.toJson(),
        );
      } else {
        await _apiServices.postData("comments_rates_table", data.toJson());
      }
      commentsRatesList.add(data);
      await _updateNumberOfReviewsForProduct(data.forProduct!);
      averageRate += data.rate!;
      numberOfAverageRates++;
      reviewsNumber++;
      increaseRatingPercentage(data.rate!);
      _divideRatingToGetPercentage();
      isUserHasRate = false;
      emit(AddCommentSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddCommentError());
    }
  }

  Future<void> _updateNumberOfReviewsForProduct(String productId) async {
    emit(UpdateNumberOfReviewsForProductLoading());
    try {
      await _apiServices.patchData("products_table?select=*&id=eq.$productId", {
        "reviews_number": commentsRatesList.length,
      });
      emit(UpdateNumberOfReviewsForProductSuccess());
    } catch (e) {
      log(e.toString());
      emit(UpdateNumberOfReviewsForProductError());
    }
  }
}
