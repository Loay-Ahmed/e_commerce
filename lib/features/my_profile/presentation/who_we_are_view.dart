import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/core/widgets/custom_nav_bar.dart';
import 'package:e_commerce/features/nav_bar/presentation/main_home_view.dart';
import 'package:e_commerce/features/nav_bar/view_model/cubit/nav_bar_cubit.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WhoWeAreView extends StatelessWidget {
  const WhoWeAreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        NavBarCubit navBarCubit = context.read<NavBarCubit>();

        if (navBarCubit.currentIndex != 3) {
          navBarCubit.changeCurrentIndex(navBarCubit.currentIndex);
          return MainHomeView();
        }
        return Scaffold(
          appBar: CustomHeader(title: S.of(context).about_us, hasBell: false),
          body: Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(16),
            child: Text(
              S.of(context).about_us_description,
              style: CustomFonts.cairoTextStyleBold_13grey500w600,
            ),
          ),

          bottomNavigationBar: CustomNavBar(),
        );
      },
    );
  }
}
