import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(length) : super(FavoriteInitial());

  // void addRemoveToFavorite(int index) {
  //   bool isFavorite = state.favorites[index];
  //   isFavorite = !isFavorite;
  //   state.favorites[index] = isFavorite;
  //   emit(FavoriteAddRemoveState(favorites: state.favorites));
  // }
}
