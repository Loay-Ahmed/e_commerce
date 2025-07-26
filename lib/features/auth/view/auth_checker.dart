import 'package:e_commerce/features/auth/view/login_view.dart';
import 'package:e_commerce/features/auth/should_delete/auth_states.dart';
import 'package:e_commerce/features/auth/view_model/cubit/authentication_cubit.dart';
import 'package:e_commerce/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../should_delete/auth_cubit.dart';

class AuthChecker extends StatefulWidget {
  const AuthChecker({super.key});

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  Widget build(BuildContext context) {
    // return auth.state is Authenticated ? const HomePage() : LoginScreen();
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        if (state is LoginSuccess) return const HomeView();
        return LoginView();
      },
    );
  }
}
