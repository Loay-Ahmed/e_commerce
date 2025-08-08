part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class AddToCartLoading extends CartState {}

final class AddToCartSuccess extends CartState {}

final class AddToCartFailure extends CartState {}

final class RemoveFromCartLoading extends CartState {}

final class RemoveFromCartSuccess extends CartState {}

final class RemoveFromCartFailure extends CartState {}

final class GetProductsCartLoading extends CartState {}

final class GetProductsCartCartSuccess extends CartState {}

final class GetProductsCartCartFailure extends CartState {}

final class QuantityChangedLoading extends CartState {}

final class QuantityChangedSuccess extends CartState {}

final class QuantityChangedFailure extends CartState {}
