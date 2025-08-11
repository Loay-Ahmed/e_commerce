import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/checkout/view_model/Cubits/form_controller_cubit/form_controller_cubit.dart';

import 'package:e_commerce/features/checkout/views/widgets/custom_form_field.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmYourOrder extends StatelessWidget {
  const ConfirmYourOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).please_confirm_order,
          style: CustomFonts.cairoTextStyleBold_13grey950w700,
        ),
        SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
            color: CustomColors.grey,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              // Change border color based on selection state.
              color: CustomColors.grey,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    S.of(context).delivery_address,
                    style: CustomFonts.cairoTextStyleBold_13grey950w700,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: CustomColors.light,
                        context: context,
                        elevation: 10,
                        isScrollControlled: true,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).viewInsets.bottom + 16,
                              top: 16,
                              left: 16,
                              right: 16,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomFormField(),
                                SizedBox(height: 20),
                                CustomButton(
                                  text: S.of(context).save,
                                  onPress: () {
                                    if (BlocProvider.of<FormControllerCubit>(
                                      context,
                                    ).onSubmitForm(context)) {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/edit.svg',
                          width: 16,
                          height: 16,
                        ),
                        Text(
                          S.of(context).edit,
                          style: CustomFonts.cairoTextStyleBold_13grey400w600,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/location.svg',
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 8),
                  BlocBuilder<FormControllerCubit, FormControllerState>(
                    builder: (context, state) {
                      return Text(
                        context
                            .watch<FormControllerCubit>()
                            .userInfoFormController
                            .addressController
                            .text
                            .trim(),
                        style: CustomFonts.cairoTextStyleBold_16grey500w400,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
