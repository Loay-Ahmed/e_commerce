import 'package:e_commerce/core/widgets/custom_nav_bar.dart';
import 'package:e_commerce/features/home/view/home_view.dart';
import 'package:e_commerce/features/nav_bar/view_model/cubit/nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeView extends StatelessWidget {
  MainHomeView({super.key});
  final List<Widget> views = [
    const HomeView(),
    const HomeView(),
    const HomeView(),
    const HomeView(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          NavBarCubit cubit = context.read<NavBarCubit>();

          return Scaffold(
            body: SafeArea(child: views[cubit.currentIndex]),
            bottomNavigationBar: CustomNavBar(),
          );
        },
      ),
    );
  }
}
