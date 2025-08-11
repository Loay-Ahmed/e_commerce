import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/auth/view/code_verification.dart';
import 'package:e_commerce/features/auth/widgets/custom_text_field.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/widgets/custom_button.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomHeader(
                title: S.of(context).forgot_password_title,
                hasBackArrow: true,
              ),
              const SizedBox(height: 40),
              Text(
                S.of(context).forgot_password_text,
                style: GoogleFonts.cairo(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.grey600,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: emailController,
                obscure: false,
                hint: '01555850155',
                inputType: TextInputType.number,
                align: TextAlign.left,
                suffix: Container(
                  padding: EdgeInsets.only(top: 13, left: 15),
                  child: Text(
                    "+20",
                    textDirection: TextDirection.ltr,
                    style: GoogleFonts.cairo(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: CustomColors.grey950,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: S.of(context).forgot_password_title,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => CodeVerification(
                            phoneNumber: emailController.text.trim(),
                          ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
