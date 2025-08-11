import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/checkout/data/controllers/user_info_controller.dart';

import 'package:e_commerce/features/checkout/view_model/Cubits/form_controller_cubit/form_controller_cubit.dart';

import 'package:e_commerce/features/checkout/views/payment_view.dart';

import 'package:e_commerce/features/checkout/views/widgets/checkout_delivery_steps.dart';

import 'package:e_commerce/features/checkout/views/widgets/custom_form_field.dart';
import 'package:e_commerce/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoView extends StatefulWidget {
  const UserInfoView({super.key});

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Initialize the controllers.
    BlocProvider.of<FormControllerCubit>(
      context,
    ).userInfoFormController = UserInfoFormController(
      fullNameController: TextEditingController(),
      emailController: TextEditingController(),
      addressController: TextEditingController(),
      cityController: TextEditingController(),
      apartmentInfoController: TextEditingController(),
      formKey: _formKey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: S.of(context).address, hasBell: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 14.5, left: 15.5, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                child: CheckoutDeliverySteps(
                  step1: true,
                  step2: true,
                  step3: false,
                  step4: false,
                ),
              ),
              SizedBox(height: 24),

              CustomFormField(),

              const SizedBox(height: 64),
              CustomButton(
                text: S.of(context).next,
                onPress: () {
                  if (BlocProvider.of<FormControllerCubit>(
                    context,
                  ).onSubmitForm(context)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => PaymentView(
                              // userInfoFormController: userInfoFormController,
                            ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
