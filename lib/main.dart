import 'package:e_commerce/core/my_observer.dart';
import 'package:e_commerce/core/utils/api_keys.dart';
import 'package:e_commerce/features/auth/view/login_view.dart';

import 'package:e_commerce/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:e_commerce/features/checkout/view_model/Cubits/form_controller_cubit/form_controller_cubit.dart';
import 'package:e_commerce/features/checkout/view_model/Cubits/payment_cubit/payment_cubit.dart';

import 'package:e_commerce/features/home/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:e_commerce/features/localization/cubit/localization_cubit.dart';
import 'package:e_commerce/features/nav_bar/presentation/main_home_view.dart';
import 'package:e_commerce/features/nav_bar/view_model/cubit/nav_bar_cubit.dart';
import 'package:e_commerce/features/notifications/view_model/view_model/cubit/notification_cubit.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: ApiKeys.supabaseUrl,
    anonKey: ApiKeys.supabaseAnonKey,
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Stripe.publishableKey = ApiKeys.publishableKey;
  Bloc.observer = MyObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FormControllerCubit()),

        BlocProvider(create: (context) => HomeCubit()..getProducts()),
        BlocProvider(create: (context) => NavBarCubit()),
        BlocProvider(
          create: (context) => PaymentCubit(checkoutRepo: CheckoutRepoImpl()),
        ),
        BlocProvider(
          create: (context) => NotificationCubit()..initializeNotifications(),
        ),
        BlocProvider(
          create: (context) => LocalizationCubit()..initCurrentLanguage(),
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
    return BlocConsumer<LocalizationCubit, LocalizationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return MaterialApp(
          locale: Locale(context.read<LocalizationCubit>().currentLanguage),
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
                  ? MainHomeView()
                  : LoginView(),
        );
      },
    );
  }
}
