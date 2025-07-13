part of 'form_controller_cubit.dart';

@immutable
sealed class FormControllerState {}

final class FormControllerInitial extends FormControllerState {}

final class OnSubmitFormState extends FormControllerState {}
