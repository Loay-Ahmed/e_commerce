import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/core/widgets/custom_nav_bar.dart';
import 'package:e_commerce/features/nav_bar/presentation/main_home_view.dart';
import 'package:e_commerce/features/nav_bar/view_model/cubit/nav_bar_cubit.dart';
import 'package:e_commerce/features/trace_order/presentation/widgets/track_order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TraceOrderMyProfileView extends StatelessWidget {
  const TraceOrderMyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        NavBarCubit navBarCubit = context.read<NavBarCubit>();

        if (navBarCubit.currentIndex != 3) {
          navBarCubit.changeCurrentIndex(
            navBarCubit.currentIndex,
          ); // fix to index 3
          return MainHomeView(); // navigate to main home view
        }
        return navBarCubit.currentIndex != 3
            ? MainHomeView()
            : Scaffold(
              appBar: CustomHeader(title: 'طلباتى', hasBell: false),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TrackOrderCard(isMyOrderProfile: true),
                      SizedBox(height: 8),
                      TrackOrderCard(isMyOrderProfile: true),
                      SizedBox(height: 8),
                      TrackOrderCard(isMyOrderProfile: true),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: CustomNavBar(),
            );
      },
    );
  }
}
