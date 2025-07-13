import 'package:e_commerce/core/utils/api_keys.dart';
import 'package:e_commerce/features/checkout/data/models/user_info_model.dart';
import 'package:e_commerce/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:e_commerce/features/checkout/view_model/Cubits/form_controller_cubit/form_controller_cubit.dart';
import 'package:e_commerce/features/checkout/view_model/Cubits/payment_cubit/payment_cubit.dart';
import 'package:e_commerce/features/checkout/views/delivery_view.dart';
import 'package:e_commerce/features/checkout/views/payment_view.dart';
import 'package:e_commerce/features/checkout/views/success_view.dart';
import 'package:e_commerce/features/checkout/views/user_info_view.dart';
import 'package:e_commerce/features/home/data/dummy_data.dart';
import 'package:e_commerce/features/home/view_model/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:e_commerce/features/onboarding/view/onboarding_screen.dart';
import 'package:e_commerce/core/data/model/product.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'features/auth/data/service/auth_service.dart';
// import 'features/auth/data/service/storage_service.dart';
import 'features/auth/data/service/user_service.dart';
import 'features/auth/view_model/auth_cubit.dart';
import 'features/onboarding/view/onboarding_screen.dart';
import 'features/product_Details/view/details_screen.dart';
import 'generated/l10n.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create:
              (context) =>
                  AuthCubit(AuthService(), UserService() /*StorageService()*/),
        ),
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
      home: DeliveryView(),
    );
  }
}
