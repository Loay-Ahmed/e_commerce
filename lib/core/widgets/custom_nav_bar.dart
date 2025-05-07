import 'package:e_commerce/core/widgets/custom_nav_bar_icon.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  List<bool> activeScreen = [true, false, false, false];
  void toggleScreen(int index) {
    activeScreen = [false, false, false, false];
    setState(() {
      activeScreen[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width >= 600 ? 400 : width,
      height: 70,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 27),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 7,
            spreadRadius: 0,
            offset: Offset(0, -2),
            blurStyle: BlurStyle.normal,
            color: Color(0x19000000),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomNavBarIcon(
            icon: Icons.home_outlined,
            active: activeScreen[0],
            toggleActive: toggleScreen,
            index: 0,
            title: "الرئيسية" /* S.of(context).nav_bar_item_1 */,
          ),
          CustomNavBarIcon(
            icon: Icons.grid_view_outlined,
            active: activeScreen[1],
            toggleActive: toggleScreen,
            index: 1,
            title: "المنتجات" /* S.of(context).nav_bar_item_1 */,
          ),
          CustomNavBarIcon(
            icon: Icons.shopping_cart_outlined,
            active: activeScreen[2],
            toggleActive: toggleScreen,
            index: 2,
            title: "سلة التسوق" /* S.of(context).nav */,
          ),
          CustomNavBarIcon(
            icon: Icons.person_outline_rounded,
            active: activeScreen[3],
            toggleActive: toggleScreen,
            index: 3,
            title: "حسابي" /* S.of(context).nav_bar_item_1 */,
          ),
        ],
      ),
    );
  }
}
