import 'package:e_commerce/features/auth/view/login.dart';
import 'package:e_commerce/features/auth/view_model/auth_states.dart';
import 'package:e_commerce/features/home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/auth_cubit.dart';

class AuthChecker extends StatefulWidget {
  const AuthChecker({super.key});

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthCubit>();
    // return auth.state is Authenticated ? const HomePage() : LoginScreen();
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      if (state is Authenticated) return const HomePage();
      return LoginScreen();
    });
  }
}
