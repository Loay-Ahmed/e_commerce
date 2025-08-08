import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void navigateToWithCubit<C extends Cubit<T>, T>({
  required BuildContext context,
  required Widget widget,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder:
          (_) => BlocProvider.value(value: context.read<C>(), child: widget),
    ),
  );
}
