import 'package:e_commerce/core/my_observer.dart';
import 'package:e_commerce/core/utils/api_keys.dart';
import 'package:e_commerce/features/auth/view/login_view.dart';
import 'package:e_commerce/features/auth/view_model/cubit/authentication_cubit.dart';

import 'package:e_commerce/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:e_commerce/features/checkout/view_model/Cubits/form_controller_cubit/form_controller_cubit.dart';
import 'package:e_commerce/features/checkout/view_model/Cubits/payment_cubit/payment_cubit.dart';

import 'package:e_commerce/features/home/data/dummy_data.dart';
import 'package:e_commerce/features/home/view/home_view.dart';
import 'package:e_commerce/features/home/view_model/cubits/favorite_cubit/favorite_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'generated/l10n.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: ApiKeys.supabaseUrl,
    anonKey: ApiKeys.supabaseAnonKey,
  );
  Stripe.publishableKey = ApiKeys.publishableKey;
  Bloc.observer = MyObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<FavoriteCubit>(
          create: (context) => FavoriteCubit(dummyProducts.length),
        ),
        BlocProvider(create: (context) => FormControllerCubit()),
        BlocProvider(create: (context) => PaymentCubit(CheckoutRepoImpl())),
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
      // home: OnboardingScreen(),
      home:
          Supabase.instance.client.auth.currentUser != null
              ? HomeView()
              : LoginView(),
    );
  }
}
