part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetProductsLoading extends HomeState {}

final class GetProductsSuccess extends HomeState {}

final class GetProductsError extends HomeState {}
