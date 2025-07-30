import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/checkout/data/controllers/user_info_controller.dart';
import 'package:flutter/material.dart';

part 'form_controller_state.dart';

class FormControllerCubit extends Cubit<FormControllerState> {
  FormControllerCubit() : super(FormControllerInitial());

  late final UserInfoFormController userInfoFormController;

  bool onSubmitForm(BuildContext context) {
    // Validate the form. If all fields are valid, it returns true.
    if (userInfoFormController.formKey.currentState!.validate()) {
      emit(OnSubmitFormState());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم إرسال البيانات بنجاح!'),
          backgroundColor: Colors.green,
        ),
      );
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('الرجاء تعبئة جميع الحقول المطلوبة'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  @override
  Future<void> close() {
    userInfoFormController.dispose();
    return super.close();
  }
}
