import 'dart:async';

import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/auth/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors.dart';
import '../view_model/auth_cubit.dart';

class NewPassword extends StatelessWidget {
  NewPassword({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool showPassword = false;
    bool showConfirmPassword = false;
    final auth = context.watch<AuthCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomAppBar(title: "كلمة مرور جديدة"),
                const SizedBox(height: 40),
                Text(
                  "قم بإنشاء كلمة مرور جديدة لتسجيل الدخول",
                  style: GoogleFonts.cairo(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.grey600,
                  ),
                ),
                const SizedBox(height: 40),

                Builder(
                  builder: (context) {
                    return CustomTextField(
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

                const SizedBox(height: 10),
                Builder(
                  builder: (context) {
                    return CustomTextField(
                      controller: confirmPasswordController,
                      obscure: !showConfirmPassword,
                      hint: 'تأكيد كلمة المرور',
                      inputType: TextInputType.visiblePassword,
                      suffix: Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: IconButton(
                          icon: Icon(
                            !showConfirmPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: CustomColors.black40,
                          ),
                          onPressed: () {
                            showConfirmPassword = !showConfirmPassword;
                            (context as Element).markNeedsBuild();
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),

                CustomButton(
                  text: 'إنشاء كلمة مرور جديدة',
                  onPress: () async {
                    // Show the dialog
                    showDialog(
                      context: context,
                      barrierDismissible:
                          false, // Prevent dismissing by tapping outside
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: SizedBox(
                            width: 342,
                            height: 266,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/done.png",
                                  width: 154,
                                ),
                                const SizedBox(height: 29),
                                Text(
                                  'تم تغيير الباسورد بنجاح',
                                  style: GoogleFonts.cairo(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: CustomColors.grey950,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );

                    // Close the dialog after 3 seconds and pop until can't pop anymore
                    Timer(const Duration(seconds: 3), () {
                      Navigator.of(context).pop(); // First pop the dialog
                      Navigator.of(
                        context,
                      ).popUntil((route) => !Navigator.canPop(context));
                    });
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
