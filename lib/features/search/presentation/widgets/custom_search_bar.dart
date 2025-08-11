import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/features/search/view_model/cubits/search_cubit/search_cubit.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: SearchBar(
        hintText: '${S.of(context).search_for} .......',
        leading: Padding(
          padding: const EdgeInsets.only(right: 6),
          child: SvgPicture.asset(
            AssetsData.searchIcon,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        ),
        backgroundColor: WidgetStateProperty.all(Colors.white),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        controller: searchController,
        trailing: [
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: SvgPicture.asset(
              AssetsData.settingSearch,
              width: 20,
              height: 20,
            ),
          ),
        ],
        // WidgetStateProperty.all() is used to set the same style for all states of the hint text
        hintStyle: WidgetStateProperty.all(
          TextStyle(
            fontFamily: 'cairo',
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: CustomColors.grey400,
          ),
        ),
        onChanged: (value) {
          if (value.isEmpty) {
            context.read<SearchCubit>().clearSearch();
          } else {
            context.read<SearchCubit>().getSearchedProducts(value);
          }
        },
        onSubmitted: (value) {
          context.read<SearchCubit>().addRecentlySearchedElements(value);
        },
      ),
    );
  }
}
