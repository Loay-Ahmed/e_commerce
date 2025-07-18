import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/custom_notified_bell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                  backgroundImage: const AssetImage(AssetsData.profileImage),
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
                    'أحمد مصطفى',
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
          SizedBox(
            height: 40,
            child: SearchBar(
              hintText: 'ابحث عن.......',
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
                // Handle search logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}
