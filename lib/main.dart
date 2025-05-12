import 'package:e_commerce/core/data/model/product.dart';
import 'package:e_commerce/features/onboarding/view/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/auth/data/service/auth_service.dart';
import 'features/auth/data/service/user_service.dart';
import 'features/auth/view/login.dart';
import 'features/auth/view_model/auth_cubit.dart';
import 'features/auth/view_model/auth_states.dart';
import 'features/product_Details/view/details_screen.dart';
import 'generated/l10n.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    BlocProvider(
      create:
          (BuildContext context) => AuthCubit(AuthService(), UserService()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale("ar"),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'E-Commerce App',
      theme: ThemeData().copyWith(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: //OnboardingScreen(),
     ProductDetailsScreen(product:  Product('بطيخ', 20.0, "assets/images/water_malon.png", 2, 2.5, 100,DateTime(2025, 12, 31), 20)),
    );
  }
}
