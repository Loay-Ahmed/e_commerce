import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/custom_grid_view_popular_products.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/home/view_model/cubits/home_cubit/home_cubit.dart';
import 'package:e_commerce/features/search/presentation/widgets/custom_recently_searched_elements.dart';
import 'package:e_commerce/features/search/presentation/widgets/custom_search_bar.dart';
import 'package:e_commerce/features/search/view_model/cubits/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHeader(
        title: 'البحث',
        hasBell: true,
        hasBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: BlocProvider(
          create:
              (context) =>
                  SearchCubit(products: context.read<HomeCubit>().products),
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              SearchCubit searchCubit = context.read<SearchCubit>();

              return SizedBox(
                // height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    CustomSearchBar(searchController: searchController),
                    SizedBox(height: 20),
                    if (searchCubit.recentlySearchedElements.isNotEmpty)
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text(
                                'عمليات البحث الاخيرة',
                                style:
                                    CustomFonts
                                        .cairoTextStyleBold_13grey950w600,
                              ),
                              GestureDetector(
                                onTap: () {
                                  searchCubit
                                      .deleteAllElementsFromRecentlySearchedElements();
                                },
                                child: Text(
                                  'حذف الكل',
                                  style:
                                      CustomFonts
                                          .cairoTextStyleBold_13grey400w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    if (state is SearchSuccess)
                      Expanded(
                        child: CustomGridViewPopularProducts(
                          products: searchCubit.searchedProducts,
                          shrinkWrap: false,
                          scrollPhysics: false,
                        ),
                      )
                    else if (state is SearchFailure)
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(AssetsData.searchFailure),
                              Text(
                                'لا يوجد نتائج',
                                style:
                                    CustomFonts
                                        .cairoTextStyleBold_16grey500w400,
                              ),
                            ],
                          ),
                        ),
                      )
                    else if (searchCubit.recentlySearchedElements.isNotEmpty)
                      CustomRecentlySearchedElements(
                        recentlySearchedElements:
                            searchCubit.recentlySearchedElements,
                      )
                    else
                      Center(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
