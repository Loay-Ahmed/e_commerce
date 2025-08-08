part of 'comment_rate_cubit.dart';

@immutable
sealed class CommentRateState {}

final class CommentRateInitial extends CommentRateState {}

final class GetCommentRateLoading extends CommentRateState {}

final class GetCommentRateSuccess extends CommentRateState {}

final class GetCommentRateError extends CommentRateState {}

final class AddOrUpdateRateLoading extends CommentRateState {}

final class AddOrUpdateRateSuccess extends CommentRateState {}

final class AddOrUpdateRateError extends CommentRateState {}

final class AddCommentLoading extends CommentRateState {}

final class AddCommentSuccess extends CommentRateState {}

final class AddCommentError extends CommentRateState {}

final class UpdateNumberOfReviewsForProductLoading extends CommentRateState {}

final class UpdateNumberOfReviewsForProductSuccess extends CommentRateState {}

final class UpdateNumberOfReviewsForProductError extends CommentRateState {}
