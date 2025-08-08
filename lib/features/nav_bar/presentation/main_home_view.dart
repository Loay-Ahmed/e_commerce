import 'package:e_commerce/core/widgets/custom_nav_bar.dart';
import 'package:e_commerce/features/cart/presentation/cart_view.dart';
import 'package:e_commerce/features/home/view/home_view.dart';
import 'package:e_commerce/features/my_profile/presentation/my_profile_view.dart';
import 'package:e_commerce/features/nav_bar/view_model/cubit/nav_bar_cubit.dart';
import 'package:e_commerce/features/notifications/presentation/simple_notification_ovely.dart';
import 'package:e_commerce/features/notifications/view_model/view_model/cubit/notification_cubit.dart';
import 'package:e_commerce/features/notifications/view_model/view_model/cubit/notification_state.dart';
import 'package:e_commerce/features/products/presentation/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeView extends StatelessWidget {
  MainHomeView({super.key});
  final List<Widget> views = [
    const HomeView(),
    const ProductsView(),
    const CartView(),
    const MyProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        NavBarCubit cubit = context.read<NavBarCubit>();

        return BlocConsumer<NotificationCubit, NotificationState>(
          listener: (context, state) {
            if (state is NotificationReceived) {
              // Show snackbar for foreground notifications
              SimpleNotificationOverlay.show(
                context,
                title: state.title,
                body: state.body,
                onTap: () {
                  print('Notification tapped: ${state.title}');
                  SimpleNotificationOverlay.hide();
                },
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(child: views[cubit.currentIndex]),
              bottomNavigationBar: CustomNavBar(),
            );
          },
        );
      },
    );
  }
}
