import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNoSearchResult extends StatelessWidget {
  const CustomNoSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AssetsData.searchFailure),
            Text(
              S.of(context).no_results,
              style: CustomFonts.cairoTextStyleBold_16grey500w400,
            ),
          ],
        ),
      ),
    );
  }
}
