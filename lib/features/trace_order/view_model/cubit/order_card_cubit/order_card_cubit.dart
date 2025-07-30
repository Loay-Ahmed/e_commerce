import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'order_card_state.dart';

class OrderCardCubit extends Cubit<OrderCardState> {
  OrderCardCubit() : super(OrderCardInitial());

  bool _isExpanded = false;
  bool get isExpanded => _isExpanded;

  void toggleExpansion() {
    _isExpanded = !_isExpanded;
    if (_isExpanded) {
      emit(OrderCardExpanded());
    } else {
      emit(OrderCardCollapsed());
    }
  }
}
