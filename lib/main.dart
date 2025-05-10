import 'package:e_commerce/features/home/data/dummy_data.dart';
import 'package:e_commerce/features/home/view_model/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:e_commerce/features/onboarding/view/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/auth/data/service/auth_service.dart';
import 'features/auth/data/service/storage_service.dart';
import 'features/auth/view_model/auth_cubit.dart';
import 'generated/l10n.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(AuthService(), StorageService()),
        ),
        BlocProvider<FavoriteCubit>(
          create: (context) => FavoriteCubit(dummyProducts.length),
        ),
      ],
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
      home: OnboardingScreen(),
    );
  }
}
