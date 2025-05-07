import 'package:e_commerce/core/widgets/custom_nav_bar.dart';
import 'package:e_commerce/features/auth/view_model/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => context.read<AuthCubit>().logout(),
              child: const Text("Home"),
            ),
          ),
          Spacer(),
          CustomNavBar(),
        ],
      ),
    );
  }
}
