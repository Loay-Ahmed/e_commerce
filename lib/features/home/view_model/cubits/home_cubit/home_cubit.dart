import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/data/services/api_services.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ApiServices _apiServices = ApiServices();
  List<ProductModel> products = [];
  final String userId = Supabase.instance.client.auth.currentUser!.id;

  Future<void> getProducts() async {
    // products = [];

    emit(GetProductsLoading());
    try {
      final Response response = await _apiServices.getData(
        'products_table?select=*,favorites_table(*),carts_table(*)',
      );
      for (var product in response.data as List) {
        products.add(ProductModel.fromJson(product));
      }

      // log(response.toString());
      // getFavoriteProducts();
      // searchProducts(query);
      // getProductsByCategory(category);
      emit(GetProductsSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetProductsError());
    }
  }
}
