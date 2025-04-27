import 'dart:async';

import 'package:e_commerce/features/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late Timer _timer;
  int time = 0;

@override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 700), (timer) {
      setState(() {
        time += 700;
      });
      if (time == 2800) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Show first image if time comes
            if (time >= 700)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/images/leaf.png",
                    width: 192,
                    height: 172,
                  ),
                ],
              ),
            Spacer(),
            if (time < 700) SizedBox(height: 172),

            // Show logo if time comes
            if (time >= 2100)
              Image.asset("assets/images/logo.png", width: 178, height: 173),
            Spacer(),
            if (time < 2100) SizedBox(height: 173),

            // Show last image if time comes
            if (time >= 1400)
              Image.asset("assets/images/circles.png", height: 156),
            if (time < 1400) SizedBox(height: 156),
          ],
        ),
      ),
    );
  }
}
