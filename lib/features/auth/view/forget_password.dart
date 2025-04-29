  import 'package:flutter/material.dart';

class ForgetPasswordorget extends StatelessWidget {
    const ForgetPasswordorget({super.key});

    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        backgroundColor: Colors.white,
         body: SafeArea(
             child: SingleChildScrollView(
             padding: const EdgeInsets.all(20.0),
      child: Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
        children: [ Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                //  color: Colors.black,
                spreadRadius: 0.2,
                blurRadius: 0,
                //offset: Offset(0, 0),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              //
            },
          ),
        ),
        const Spacer(),
        const Text(
           ' نسيان كلمة المرور ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(flex: 2),
       ]
        ),
          const SizedBox(height: 40),
        const  Text("لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق",style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0XFFFF616A6B),
            fontFamily: 'Cairo'
        ),
        ),

        TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          prefix: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text('+20', style: TextStyle(fontSize: 16)),
          ),
          hintText: '1061005252',
          border: const OutlineInputBorder(),

        ),
      ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            // تسجيل الدخول
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0XFF1B5E37),
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            "نسيت كلمةالمرور",
            style: TextStyle(color: Colors.white,fontSize: 18),
          ),
        ),
         ]
      )
         ),
      ),
         ),
      );
    }
  }
