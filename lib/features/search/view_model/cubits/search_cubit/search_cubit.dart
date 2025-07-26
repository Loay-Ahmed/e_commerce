// import 'package:bloc/bloc.dart';

// part 'search_state.dart';

// class SearchCubit extends Cubit<SearchState> {
//   SearchCubit() : super(SearchInitial());
//   // function to return list of restaurants that have searched product

//   void getResult(String query, List<Product> products) {
//     emit(SearchLoading());
//     final uniqueNames = <String>{};
//     List<Product> filteredProducts =
//         products
//             .where(
//               (product) =>
//                   product.name!.toLowerCase().contains(query.toLowerCase()) &&
//                   uniqueNames.add(product.name!.toLowerCase()),
//             )
//             .toList();

//     if (filteredProducts.isEmpty) {
//       emit(SearchFailure());
//     } else {
//       emit(SearchSuccess(filteredProducts));
//     }
//   }
// }
