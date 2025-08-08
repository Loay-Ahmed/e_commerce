import 'package:e_commerce/core/fonts.dart';

import 'package:e_commerce/core/widgets/custom_back_arrow.dart';
import 'package:e_commerce/core/widgets/custom_notified_bell.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomHeader({
    super.key,
    required this.title,
    this.hasBell = true,
    this.hasBackArrow = true,
  });
  final bool hasBell;
  final bool hasBackArrow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        title: Text(title, style: CustomFonts.cairoTextStyleBold_19grey950w700),
        centerTitle: true,

        // disable the default back button
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        // shadowColor: Colors.transparent,
        // ! very important line
        surfaceTintColor: Colors.transparent,
        // systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading:
            hasBackArrow
                ? Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SizedBox(
                    width: 44,
                    height: 44,
                    child: CustomBackArrow(),
                  ),
                )
                : null,
        actions: hasBell ? [CustomNotifiedBell()] : null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
