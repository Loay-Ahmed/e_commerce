import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/auth/view/Sign_up.dart';
import 'package:e_commerce/features/auth/view/forget_password.dart';
import 'package:e_commerce/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view_model/auth_cubit.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/mix_text_button.dart';
import '../widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomAppBar(title: "تسجيل دخول"),
                const SizedBox(height: 40),
                CustomTextField(
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                  obscure: false,
                  hint: 'البريد الإلكتروني',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: passwordController,
                  obscure: true,
                  inputType: TextInputType.visiblePassword,
                  hint: 'كلمة المرور',
                  suffix: Padding(
                    padding: EdgeInsets.only(left: 33),
                    child: Icon(
                      Icons.visibility_rounded,
                      color: CustomColors.black40,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPassword(),
                        ),
                      );
                    },
                    child: Text(
                      'نسيت كلمة المرور؟',
                      style: GoogleFonts.cairo(color: Color(0Xffff2d9f5d)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'تسجيل دخول',
                  onPress: () {
                    auth.login(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                  },
                ),
                const SizedBox(height: 20),
                MixTextButton(
                  text1: 'لا تمتلك حساب؟  ',
                  text2: 'قم بإنشاء حساب',
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.grey.shade400),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'أو',
                        style: GoogleFonts.cairo(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.grey.shade400),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SocialButton(
                  text: "تسجيل بواسطة جوجل",
                  icon: SvgPicture.asset("assets/images/google_icon.svg"),
                  onPressed: () {},
                ),
                const SizedBox(height: 30),
                SocialButton(
                  text: "تسجيل بواسطة آبل",
                  icon: Icon(Icons.apple, size: 24, color: Colors.black),
                  onPressed: () {},
                ),
                const SizedBox(height: 22),
                SocialButton(
                  text: "تسجيل بواسطة فيسبوك",
                  icon: Icon(
                    Icons.facebook,
                    size: 24,
                    color: Colors.blue.shade700,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
