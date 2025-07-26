import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/functions/navigate_to.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/custom_notified_bell.dart';
import 'package:e_commerce/features/auth/view_model/cubit/authentication_cubit.dart';
import 'package:e_commerce/features/search/presentation/search_view.dart';
import 'package:e_commerce/features/search/presentation/widgets/custom_search_bar.dart';
import 'package:e_commerce/features/search/presentation/widgets/custom_search_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit()..getUserData(),
      child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          AuthenticationCubit auth = context.read<AuthenticationCubit>();
          return SizedBox(
            height: 110,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  // crossAxisAlignment in row is used to align children vertically
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: CustomColors.green500,
                        backgroundImage: const AssetImage(
                          AssetsData.profileImage,
                        ),
                        // child: Icon(Icons.menu, color: Colors.white),
                      ),
                    ),

                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'صباح الخير !..',
                          style: TextStyle(
                            fontFamily: 'cairo',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: CustomColors.grey400,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          auth.userDataModel?.name ?? 'ابلع',
                          style: CustomFonts.cairoTextStyleBold_16grey950w700,
                        ),
                      ],
                    ),
                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.all(8.0),

                      // child: CircleAvatar(
                      //   radius: 17,
                      //   backgroundColor: CustomColors.green50,
                      //   child: SvgPicture.asset(AssetsData.bell, width: 20, height: 20),
                      // ),
                      child: CustomNotifiedBell(),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                CustomSearchBarButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
