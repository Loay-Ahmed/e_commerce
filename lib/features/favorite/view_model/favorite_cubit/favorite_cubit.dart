import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/data/services/api_services.dart';
import 'package:e_commerce/features/home/data/models/favorites_model.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({required this.products}) : super(FavoriteInitial());

  final ApiServices _apiServices = ApiServices();
  final String userId = Supabase.instance.client.auth.currentUser!.id;
  final List<ProductModel> products;

  List<ProductModel> favoriteProducts = [];
  Map<String, bool> favoriteProductsMap = {};
  // void addRemoveToFavorite(int index) {
  //   bool isFavorite = state.favorites[index];
  //   isFavorite = !isFavorite;
  //   state.favorites[index] = isFavorite;
  //   emit(FavoriteAddRemoveState(favorites: state.favorites));
  // }

  Future<void> addToFavorites(String productId) async {
    try {
      emit(AddToFavoriteLoading());
      final FavoritesModel favoritesModel = FavoritesModel(
        forUser: userId,
        forProduct: productId,
        isFavorite: true,
      );

      await _apiServices.postData('favorites_table', favoritesModel.toJson());
      for (var product in products) {
        if (product.id == productId) {
          favoriteProducts.add(product);
          break;
        }
      }
      favoriteProductsMap.addAll({productId: true});
      emit(AddToFavoriteSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddToFavoriteError());
    }
  }

  Future<void> removeFromFavorites(String productId) async {
    emit(RemoveFromFavoriteLoading());
    try {
      final response = await _apiServices.deleteData(
        'favorites_table?for_product=eq.$productId&for_user=eq.$userId',
      );
      log(response.toString());
      // await getProducts();
      favoriteProductsMap.removeWhere((key, value) {
        return key == productId;
      });

      emit(RemoveFromFavoriteSuccess());
    } catch (e) {
      log(e.toString());
      emit(RemoveFromFavoriteError());
    }
  }

  bool isFavorite(String productId) {
    return favoriteProductsMap.containsKey(productId);
  }

  Future<void> getFavoriteProducts() async {
    emit(GetFavoriteProductsLoading());
    try {
      final response = await _apiServices.getData(
        'favorites_table?select=*&for_user=eq.$userId',
        // favoritesModel.toJson(),
      );
      // log(response.toString());

      for (var favProduct in response.data as List) {
        FavoritesModel favorite = FavoritesModel.fromJson(favProduct);
        for (var product in products) {
          if (product.id == favorite.forProduct) {
            favoriteProducts.add(product);
            break;
          }
        }
        // favoriteProducts.add(favorite);
        favoriteProductsMap.addAll({favorite.forProduct!: true});
      }
      // favoriteProductsIds.addAll(response.data);
      // log('${favoriteProducts.length}       hellloooooooooooooooooooooo');
      // await getProducts();
      // favoriteProducts.addAll({productId: true});

      emit(GetFavoriteProductsSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetFavoriteProductsError());
    }
  }
}
