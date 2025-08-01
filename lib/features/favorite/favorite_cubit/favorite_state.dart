part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {
  const FavoriteState();
}

final class FavoriteInitial extends FavoriteState {
  const FavoriteInitial();
}

final class GetFavoriteProductsLoading extends FavoriteState {}

final class GetFavoriteProductsSuccess extends FavoriteState {}

final class GetFavoriteProductsError extends FavoriteState {}

final class AddToFavoriteLoading extends FavoriteState {}

final class AddToFavoriteSuccess extends FavoriteState {}

final class AddToFavoriteError extends FavoriteState {}

final class RemoveFromFavoriteLoading extends FavoriteState {}

final class RemoveFromFavoriteSuccess extends FavoriteState {}

final class RemoveFromFavoriteError extends FavoriteState {}
