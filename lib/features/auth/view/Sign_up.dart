import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController NameController = TextEditingController();
    final TextEditingController EmailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    bool showPassword = false;
    bool isAgreed=false;
    return Scaffold(
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
                  children: [
                    Container(
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
                      'حساب جديد',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
                const SizedBox(height: 40),


                TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'الاسم الكامل',
                 //   prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'البريد الإلكتروني',
                //    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Builder(
                  builder: (context) {
                    return TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                      filled: true,
                        fillColor: Colors.white,
                        hintText: 'كلمة المرور',
                       contentPadding:
                       const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: const BorderSide(
                             color: Colors.white,
                             width: 2.5,
                           ),
                         ),
                          suffixIcon: IconButton( icon:
                          Icon(
                            showPassword ? Icons.visibility :Icons.visibility_off,
                          ),
                            onPressed: () {
                            showPassword=!showPassword;
                            (context as Element ).markNeedsBuild();
                            },
                          )
                        ),
                      );
                  }
                ),
                const SizedBox(height: 5),
                Builder(
                  builder: (ctx) {
                    return Column(
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
                              activeColor: Colors.blue,
                            ),
                            const Text(
                              'موافقة على الشروط والتحكم الخاصة بنا',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: isAgreed ? () {

                            } : null,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: isAgreed ? Colors.blue : Colors.grey,
                            ),
                            child: const Text(
                              'إنشاء حساب جديد',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),

                // Builder(
                //   builder: (context) {
                //     return Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Checkbox(
                //           value: isAgreed,
                //             onChanged: (value) {
                //             {
                //               isAgreed = value!;
                //               (context as Element ).markNeedsBuild();
                //             };
                //           },
                //           activeColor: Colors.blue,
                //         ),
                //         const Text(
                //           'موافقة على الشروط والتحكم الخاصة بنا',
                //           style: TextStyle(fontSize: 14),
                //         ),
                //       ],
                //     );
                //   }
                // ),
                // Builder(
                //   builder: (ctx) {
                //     return SizedBox(
                //       width: double.infinity,
                //       child: ElevatedButton(
                //         onPressed:   isAgreed ? (){
                //
                //
                //         }:null,
                //
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: const Color(0XFFFF1B5E37),
                //           padding: const EdgeInsets.symmetric(vertical: 16),
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(12),
                //           ),
                //         ),
                //         child: const Text(
                //            'إنشاء حساب جديد',
                //           style: TextStyle(color: Color(0XFFFFFFFFF),fontSize: 18),
                //         ),
                //
                //
                //       ),
                //     );
                //   }
                //
                // ),
                const SizedBox(height: 20),

                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text.rich(
                      TextSpan(
                        text: 'لديك حساب بالفعل؟ ',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'سجّل الدخول',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
