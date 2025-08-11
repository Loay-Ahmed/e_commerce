import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/auth/widgets/custom_text_field.dart';
import 'package:e_commerce/features/nav_bar/presentation/main_home_view.dart';
import 'package:e_commerce/features/nav_bar/view_model/cubit/nav_bar_cubit.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoView extends StatefulWidget {
  const PersonalInfoView({super.key});

  @override
  State<PersonalInfoView> createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController currentPasswordController;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmNewPasswordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        NavBarCubit navBarCubit = context.read<NavBarCubit>();

        if (navBarCubit.currentIndex != 3) {
          navBarCubit.changeCurrentIndex(
            navBarCubit.currentIndex,
          ); // fix to index 3
          return MainHomeView(); // navigate to main home view
        }
        return Scaffold(
          appBar: CustomHeader(title: S.of(context).profile, hasBell: false),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            S.of(context).personal_information,
                            style: CustomFonts.cairoTextStyleBold_13grey950w600,
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: nameController,
                            obscure: false,
                            hint: 'احمد ياسر',
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: emailController,
                            obscure: false,
                            hint: 'm@gmail.com',
                          ),
                          SizedBox(height: 16),
                          Text(
                            S.of(context).change_password,
                            style: CustomFonts.cairoTextStyleBold_13grey950w600,
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: currentPasswordController,
                            obscure: true,
                            hint: 'كلمة المرور الحالى',
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: newPasswordController,
                            obscure: true,
                            hint: S.of(context).new_password_hint,
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: confirmNewPasswordController,
                            obscure: true,
                            hint: S.of(context).confirm_new_password_hint,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: CustomButton(
                        text: S.of(context).save_changes,
                        onPress: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
