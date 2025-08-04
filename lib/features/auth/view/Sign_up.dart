import 'package:e_commerce/core/functions/navigate_without_back.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/auth/view/login_view.dart';
import 'package:e_commerce/features/auth/view_model/cubit/authentication_cubit.dart';
import 'package:e_commerce/features/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors.dart';
import '../widgets/mix_text_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    bool showPassword = false;
    bool isAgreed = false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomHeader(title: 'حساب جديد', hasBackArrow: true),
              const SizedBox(height: 40),

              CustomTextFormField(
                controller: nameController,
                obscure: false,
                hint: 'الاسم الكامل',
                inputType: TextInputType.name,
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                controller: emailController,
                obscure: false,
                hint: 'البريد الإلكتروني',
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              Builder(
                builder: (context) {
                  return CustomTextFormField(
                    controller: passwordController,
                    obscure: !showPassword,
                    hint: 'كلمة المرور',
                    inputType: TextInputType.visiblePassword,
                    suffix: Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: IconButton(
                        icon: Icon(
                          !showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: CustomColors.black40,
                        ),
                        onPressed: () {
                          showPassword = !showPassword;
                          (context as Element).markNeedsBuild();
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 5),
              Builder(
                builder: (ctx) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: isAgreed,
                            onChanged: (value) {
                              isAgreed = value!;
                              (ctx as Element).markNeedsBuild();
                            },
                            activeColor: CustomColors.green1_500,
                          ),
                          Text(
                            'موافقة على الشروط والتحكم الخاصة بنا',
                            style: GoogleFonts.cairo(fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      BlocProvider(
                        create: (context) => AuthenticationCubit(),
                        child: BlocConsumer<
                          AuthenticationCubit,
                          AuthenticationState
                        >(
                          listener: (context, state) {
                            if (state is SignUpSuccess) {
                              navigateWithoutBack(context, LoginView());
                            }
                          },
                          builder: (context, state) {
                            final auth = context.read<AuthenticationCubit>();
                            return CustomButton(
                              text: 'إنشاء حساب جديد',
                              isLoading: state is SignUpLoading ? true : false,
                              onPress:
                                  isAgreed
                                      ? () async {
                                        await auth.register(
                                          name: nameController.text.trim(),
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim(),
                                        );
                                      }
                                      : null,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 20),
              MixTextButton(
                text1: 'لديك حساب بالفعل؟  ',
                text2: 'تسجيل الدخول',
                onPress: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginView()),
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
