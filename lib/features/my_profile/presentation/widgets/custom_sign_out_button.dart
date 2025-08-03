import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/functions/navigate_without_back.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/features/auth/view/login_view.dart';
import 'package:e_commerce/features/auth/view_model/cubit/authentication_cubit.dart';
import 'package:e_commerce/features/nav_bar/view_model/cubit/nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomSignOutButton extends StatelessWidget {
  const CustomSignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            // context.read<NavBarCubit>().changeCurrentIndex(0);
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const LoginView()),
              (Route<dynamic> route) => false,
            );
          }
        },
        builder: (context, state) {
          AuthenticationCubit auth = context.read<AuthenticationCubit>();
          return GestureDetector(
            onTap: () async {
              await auth.signOut();
            },
            child: Container(
              height: 41,
              width: double.infinity,
              alignment: Alignment.center,
              color: CustomColors.green1_50,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'تسجيل الخروج',
                    style: CustomFonts.cairoTextStyleBold_13green1_500w600,
                  ),
                  SizedBox(width: 30),
                  SvgPicture.asset(AssetsData.logout),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
