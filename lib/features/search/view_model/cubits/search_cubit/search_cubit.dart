import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.products}) : super(SearchInitial());

  final List<ProductModel> products;
  List<ProductModel> searchedProducts = [];
  List<String> recentlySearchedElements = [];

  void getSearchedProducts(String query) {
    emit(SearchLoading());
    searchedProducts.clear();
    searchedProducts =
        products
            .where(
              (product) =>
                  product.name!.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    if (searchedProducts.isEmpty) {
      emit(SearchFailure());
    } else {
      emit(SearchSuccess());
    }
  }

  void clearSearch() {
    searchedProducts.clear();
    emit(SearchInitial());
  }

  void addRecentlySearchedElements(String text) {
    recentlySearchedElements.add(text);
    // emit(SearchRecentlyAdded());
  }

  void deleteElementFromRecentlySearchedElements(int index) {
    recentlySearchedElements.removeAt(index);
    emit(SearchRecentlyDelete());
  }

  void deleteAllElementsFromRecentlySearchedElements() {
    recentlySearchedElements.clear();
    emit(SearchRecentlyDelete());
  }
}
