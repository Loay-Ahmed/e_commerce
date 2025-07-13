import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/home/data/dummy_data.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(length)
    : super(
        FavoriteInitial(
          favorites:
              dummyProducts
                  .map((product) => product.isFavorite)
                  .toList()
                  .cast<bool>(),
        ),
      );

  void addRemoveToFavorite(int index) {
    bool isFavorite = state.favorites[index];
    isFavorite = !isFavorite;
    state.favorites[index] = isFavorite;
    emit(FavoriteAddRemoveState(favorites: state.favorites));
  }
}
