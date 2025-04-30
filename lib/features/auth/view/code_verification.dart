import 'package:e_commerce/features/auth/data/service/auth_service.dart';
import 'package:e_commerce/features/auth/data/service/storage_service.dart';
import 'package:e_commerce/features/auth/view_model/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors.dart';
import '../widgets/code_input_field.dart';
import '../widgets/custom_app_bar.dart';
import 'new_password.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<CodeVerification> createState() => CodeVerificationScreenState();
}

class CodeVerificationScreenState extends State<CodeVerification> {
  final codeControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  String getCode() {
    String code = "";
    for (TextEditingController element in codeControllers) {
      code += element.text.trim();
    }
    return code;
  }

  @override
  Widget build(BuildContext context) {
    final auth = AuthCubit(AuthService(), StorageService());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(title: "التحقق من الرمز",),
              const SizedBox(height: 40),
              Text(
                "أدخل الرمز الذي أرسلناه إلى رقم الهاتف ${widget.phoneNumber}",
                style: GoogleFonts.cairo(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.grey600,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CodeInputField(controller: codeControllers[3]),
                  CodeInputField(controller: codeControllers[2]),
                  CodeInputField(controller: codeControllers[1]),
                  CodeInputField(controller: codeControllers[0]),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  bool verify = await auth.checkCode(getCode());
                  if (verify) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewPassword()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Invalid code")));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.green1_500,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "تحقق من الرمز",
                  style: GoogleFonts.cairo(color: Colors.white, fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  auth.forgotPassword(widget.phoneNumber);
                },
                child: Text(
                  "إعادة إرسال الرمز",
                  style: GoogleFonts.cairo(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.green1_600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}