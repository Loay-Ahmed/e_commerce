import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/auth/widgets/custom_text_field.dart';
import 'package:e_commerce/features/nav_bar/presentation/main_home_view.dart';
import 'package:e_commerce/features/nav_bar/view_model/cubit/nav_bar_cubit.dart';
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
          appBar: CustomHeader(title: 'الملف الشخصى', hasBell: false),
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
                            'المعلومات الشخصيه',
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
                            'تغيير كلمة المرور',
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
                            hint: 'كلمة المرور الجديدة',
                          ),
                          SizedBox(height: 8),
                          CustomTextFormField(
                            controller: confirmNewPasswordController,
                            obscure: true,
                            hint: 'تأكيد كلمة المرور الجديدة',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: CustomButton(
                        text: 'حفظ التغييرات',
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
