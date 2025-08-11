import 'package:e_commerce/features/auth/widgets/custom_text_field.dart';
import 'package:e_commerce/features/checkout/view_model/Cubits/form_controller_cubit/form_controller_cubit.dart';
import 'package:e_commerce/generated/l10n.dart';
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
            obscure: false,
            hint: S.of(context).full_name,
            controller:
                BlocProvider.of<FormControllerCubit>(
                  context,
                ).userInfoFormController.fullNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).please_enter_full_name;
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          CustomTextFormField(
            obscure: false,
            hint: S.of(context).email,
            controller:
                BlocProvider.of<FormControllerCubit>(
                  context,
                ).userInfoFormController.emailController,
            inputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).please_enter_email;
              }
              // A simple regex for email validation.
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return S.of(context).please_enter_valid_email;
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          CustomTextFormField(
            obscure: false,
            hint: S.of(context).address,
            controller:
                BlocProvider.of<FormControllerCubit>(
                  context,
                ).userInfoFormController.addressController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).please_enter_address;
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          CustomTextFormField(
            obscure: false,

            hint: S.of(context).city,
            controller:
                BlocProvider.of<FormControllerCubit>(
                  context,
                ).userInfoFormController.cityController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).please_enter_city;
              }
              return null;
            },
          ),
          SizedBox(height: 8),
          CustomTextFormField(
            obscure: false,
            hint: S.of(context).floor_apartment_hint,
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
