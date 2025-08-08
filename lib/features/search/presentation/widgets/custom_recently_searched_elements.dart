import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/features/search/view_model/cubits/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomRecentlySearchedElements extends StatelessWidget {
  const CustomRecentlySearchedElements({
    super.key,
    required this.recentlySearchedElements,
  });

  final List<String> recentlySearchedElements;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: recentlySearchedElements.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 30,
            child: Row(
              children: [
                SvgPicture.asset(AssetsData.time),
                SizedBox(width: 16),
                Text(
                  recentlySearchedElements[index],
                  style: CustomFonts.cairoTextStyleBold_16grey950w400,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    context
                        .read<SearchCubit>()
                        .deleteElementFromRecentlySearchedElements(index);
                  },
                  child: SvgPicture.asset(AssetsData.delete),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
