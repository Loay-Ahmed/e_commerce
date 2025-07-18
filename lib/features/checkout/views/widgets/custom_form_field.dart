import 'package:e_commerce/features/checkout/view_model/Cubits/form_controller_cubit/form_controller_cubit.dart';
import 'package:e_commerce/features/checkout/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key:
          BlocProvider.of<FormControllerCubit>(
            context,
          ).userInfoFormController.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'الاسم كامل',
            controller:
                BlocProvider.of<FormControllerCubit>(
                  context,
                ).userInfoFormController.fullNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال الاسم الكامل';
              }
              return null;
            },
          ),
          CustomTextFormField(
            hintText: 'البريد الإلكتروني',
            controller:
                BlocProvider.of<FormControllerCubit>(
                  context,
                ).userInfoFormController.emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال البريد الإلكتروني';
              }
              // A simple regex for email validation.
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'الرجاء إدخال بريد إلكتروني صالح';
              }
              return null;
            },
          ),
          CustomTextFormField(
            hintText: 'العنوان',
            controller:
                BlocProvider.of<FormControllerCubit>(
                  context,
                ).userInfoFormController.addressController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال العنوان';
              }
              return null;
            },
          ),
          CustomTextFormField(
            hintText: 'المدينه',
            controller:
                BlocProvider.of<FormControllerCubit>(
                  context,
                ).userInfoFormController.cityController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال المدينه';
              }
              return null;
            },
          ),
          CustomTextFormField(
            hintText: 'رقم الطابق, رقم الشقه ..',
            controller:
                BlocProvider.of<FormControllerCubit>(
                  context,
                ).userInfoFormController.apartmentInfoController,
          ),
        ],
      ),
    );
  }
}
