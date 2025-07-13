part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {
  const FavoriteState({required this.favorites});
  final List<bool> favorites;
}

final class FavoriteInitial extends FavoriteState {
  const FavoriteInitial({required super.favorites});
}

final class FavoriteAddRemoveState extends FavoriteState {
  const FavoriteAddRemoveState({required super.favorites});
}
