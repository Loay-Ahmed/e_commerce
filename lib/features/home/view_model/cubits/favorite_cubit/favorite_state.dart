part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {
  const FavoriteState(/*{required this.favorites}*/);
  // final List<bool> favorites;
}

final class FavoriteInitial extends FavoriteState {
  const FavoriteInitial(/*{required super.favorites}*/);
}

final class AddToFavoriteLoading extends FavoriteState {}

final class AddToFavoriteSuccess extends FavoriteState {}

final class AddToFavoriteError extends FavoriteState {}

final class RemoveFromFavoriteLoading extends FavoriteState {}

final class RemoveFromFavoriteSuccess extends FavoriteState {}

final class RemoveFromFavoriteError extends FavoriteState {}
