import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    "تسجيل دخول",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: emailController,
                  keyboardType:TextInputType.emailAddress ,
                  decoration: InputDecoration(
                    hintText: 'البريد الإلكتروني',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  keyboardType:TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'كلمة المرور',
                    suffixIcon: Icon(Icons.visibility_off),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                       // action of forget password

                    },
                    child: const Text(
                      'نسيت كلمة المرور؟',
                      style: TextStyle(color: Color(0XFFFF2D9F5D)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
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
                    'تسجيل دخول',
                    style: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // إنشاء حساب جديد
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: 'لا تمتلك حساب؟ ',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'قم بإنشاء حساب',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey.shade400,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'أو',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
              ),
                const SizedBox(height: 30),
              SocialButton(
                  text: "تسجيل بواسطة جوجل",
                  icon: Icons.g_mobiledata,
                  onPressed: () {},
                ),
                const SizedBox(height: 30),
                SocialButton(
                  text: "تسجيل بواسطة آبل",
                  icon: Icons.apple,
                  onPressed: () {},
                ),
                const SizedBox(height: 22),
                SocialButton(
                  text: "تسجيل بواسطة فيسبوك",
                  icon: Icons.facebook,
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

class SocialButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 24, color: Colors.black),
      label: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}