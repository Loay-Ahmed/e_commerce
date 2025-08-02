import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/data/services/api_services.dart';
import 'package:e_commerce/features/home/data/models/carts_model.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.products}) : super(CartInitial());
  final ApiServices _apiServices = ApiServices();
  final String userId = Supabase.instance.client.auth.currentUser!.id;
  final List<ProductModel> products;
  int dummyQuantity = 1;

  List<ProductModel> cartProducts = [];
  Map<String, int> cartProductsMapQuantity = {};
  // void addRemoveToFavorite(int index) {
  //   bool isFavorite = state.favorites[index];
  //   isFavorite = !isFavorite;
  //   state.favorites[index] = isFavorite;
  //   emit(FavoriteAddRemoveState(favorites: state.favorites));
  // }

  void increaseDummyQuantity() {
    dummyQuantity++;
  }

  void decreaseDummyQuantity() {
    dummyQuantity++;
  }

  void initDummyQuantityValue() {
    dummyQuantity = 1;
  }

  Future<void> addProductToCart(String productId, int quantity) async {
    try {
      emit(AddToCartLoading());
      final CartsModel cartsModel = CartsModel(
        forUser: userId,
        forProduct: productId,
        quantity: quantity,
        isInCart: true,
      );

      await _apiServices.postData('carts_table', cartsModel.toJson());
      for (var product in products) {
        if (product.id == productId) {
          cartProducts.add(product);
          break;
        }
      }
      cartProductsMapQuantity.addAll({productId: quantity});
      emit(AddToCartSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddToCartFailure());
    }
  }

  Future<void> removeProductFromCart(String productId) async {
    emit(RemoveFromCartLoading());
    try {
      final response = await _apiServices.deleteData(
        'carts_table?for_product=eq.$productId&for_user=eq.$userId',
      );
      log(response.toString());
      // await getProducts();
      cartProductsMapQuantity.removeWhere((key, value) {
        return key == productId;
      });

      for (var product in products) {
        if (product.id == productId) {
          cartProducts.remove(product);
          break;
        }
      }

      emit(RemoveFromCartSuccess());
    } catch (e) {
      log(e.toString());
      emit(RemoveFromCartFailure());
    }
  }

  int getProductQuantityInCartIfExist(String? productId) {
    return cartProductsMapQuantity.containsKey(productId)
        ? cartProductsMapQuantity[productId]!
        : 0;
  }

  Future<void> getProductsCart() async {
    emit(GetProductsCartLoading());
    try {
      final response = await _apiServices.getData(
        'carts_table?select=*&for_user=eq.$userId',
        // favoritesModel.toJson(),
      );
      // log(response.toString());

      for (var cartProduct in response.data as List) {
        CartsModel carts = CartsModel.fromJson(cartProduct);
        for (var product in products) {
          if (product.id == carts.forProduct) {
            cartProducts.add(product);
            break;
          }
        }
        // favoriteProducts.add(favorite);
        cartProductsMapQuantity.addAll({carts.forProduct!: carts.quantity!});
      }
      // favoriteProductsIds.addAll(response.data);
      // log('${favoriteProducts.length}       hellloooooooooooooooooooooo');
      // await getProducts();
      // favoriteProducts.addAll({productId: true});

      emit(GetProductsCartCartSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetProductsCartCartFailure());
    }
  }

  Future<void> increaseQuantity(String productId) async {
    try {
      emit(QuantityChangedLoading());
      if (getProductQuantityInCartIfExist(productId) != 0) {
        cartProductsMapQuantity[productId] =
            (cartProductsMapQuantity[productId] ?? 0) + 1;

        await _apiServices.patchData(
          'carts_table?select=*&for_user=eq.$userId&for_product=eq.$productId',
          {'quantity': cartProductsMapQuantity[productId]},
        );
      }
      emit(QuantityChangedSuccess());
    } catch (e) {
      log(e.toString());
      emit(QuantityChangedFailure());
    }
  }

  Future<void> decreaseQuantity(String productId) async {
    try {
      emit(QuantityChangedLoading());
      if (getProductQuantityInCartIfExist(productId) != 0 &&
          cartProductsMapQuantity[productId]! > 1) {
        cartProductsMapQuantity[productId] =
            (cartProductsMapQuantity[productId]! - 1);

        await _apiServices.patchData(
          'carts_table?select=*&for_user=eq.$userId&for_product=eq.$productId',
          {'quantity': cartProductsMapQuantity[productId].toString()},
        );
      }
      emit(QuantityChangedSuccess());
    } catch (e) {
      e.toString();
      emit(QuantityChangedFailure());
    }
  }
}
