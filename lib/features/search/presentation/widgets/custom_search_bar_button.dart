import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/functions/navigate_to.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/features/search/presentation/search_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBarButton extends StatelessWidget {
  const CustomSearchBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateTo(context, const SearchView()),
      child: Container(
        height: 40,

        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
          border: Border.all(color: CustomColors.grey50),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AssetsData.searchIcon,
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                '${S.of(context).search_for} .......',
                style: TextStyle(
                  fontFamily: 'cairo',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.grey400,
                ),
              ),
            ),
            SvgPicture.asset(
              AssetsData.settingSearch,
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
