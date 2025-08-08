part of 'order_card_cubit.dart';

@immutable
sealed class OrderCardState {}

final class OrderCardInitial extends OrderCardState {}

class OrderCardExpanded extends OrderCardState {}

class OrderCardCollapsed extends OrderCardState {}

final class GetOrdersLoading extends OrderCardState {}

final class GetOrdersSuccess extends OrderCardState {}

final class GetOrdersError extends OrderCardState {}

final class AddOrdersLoading extends OrderCardState {}

final class AddOrdersSuccess extends OrderCardState {}

final class AddOrdersError extends OrderCardState {}
