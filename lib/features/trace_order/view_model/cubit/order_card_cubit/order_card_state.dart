part of 'order_card_cubit.dart';

@immutable
sealed class OrderCardState {}

final class OrderCardInitial extends OrderCardState {}

class OrderCardExpanded extends OrderCardState {}

class OrderCardCollapsed extends OrderCardState {}
