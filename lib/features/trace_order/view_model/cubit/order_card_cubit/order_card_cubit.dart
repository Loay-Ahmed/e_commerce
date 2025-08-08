import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/data/services/api_services.dart';
import 'package:e_commerce/features/trace_order/data/models/order_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'order_card_state.dart';

class OrderCardCubit extends Cubit<OrderCardState> {
  OrderCardCubit() : super(OrderCardInitial());

  final ApiServices _apiServices = ApiServices();
  final String userId = Supabase.instance.client.auth.currentUser!.id;

  List<OrderModel> ordersList = [];
  OrderModel currentOrder = OrderModel();
  Map<String, bool> isExpandedOrderMap = {};
  // void addRemoveToFavorite(int index) {
  //   bool isFavorite = state.favorites[index];
  //   isFavorite = !isFavorite;
  //   state.favorites[index] = isFavorite;
  //   emit(FavoriteAddRemoveState(favorites: state.favorites));
  // }

  Future<void> getOrders() async {
    emit(GetOrdersLoading());
    try {
      final response = await _apiServices.getData(
        'orders_table?select=*&for_user=eq.$userId',
        // favoritesModel.toJson(),
      );
      // log(response.toString());

      for (var ordersFromUser in response.data as List) {
        OrderModel order = OrderModel.fromJson(ordersFromUser);
        ordersList.add(order);
        isExpandedOrderMap.addAll({order.id!: false});
      }

      emit(GetOrdersSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetOrdersError());
    }
  }

  Future<void> addOrder({required OrderModel orderModel}) async {
    try {
      emit(AddOrdersLoading());
      orderModel.forUser = userId;

      log(orderModel.toJson().toString());

      await _apiServices.postData('orders_table', orderModel.toJson());
      currentOrder = orderModel;

      emit(AddOrdersSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddOrdersError());
    }
  }

  bool isOrderExpanded({required String orderId}) {
    return isExpandedOrderMap[orderId] ?? false;
  }

  void toggleExpansion({required String orderId}) {
    if (isExpandedOrderMap[orderId] == null) {
      isExpandedOrderMap.addAll({orderId: false});
    }
    isExpandedOrderMap[orderId] = !isExpandedOrderMap[orderId]!;

    if (isOrderExpanded(orderId: orderId)) {
      emit(OrderCardExpanded());
    } else {
      emit(OrderCardCollapsed());
    }
  }
}
