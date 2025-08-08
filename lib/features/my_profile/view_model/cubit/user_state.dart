part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class GetUserDataLoading extends UserState {}

final class GetUserDataSuccess extends UserState {}

final class GetUserDataFailure extends UserState {}

final class UpdateUserPictureLoading extends UserState {}

final class UpdateUserPictureSuccess extends UserState {}

final class UpdateUserPictureFailure extends UserState {}
