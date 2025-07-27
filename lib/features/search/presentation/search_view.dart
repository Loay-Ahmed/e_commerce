import 'package:e_commerce/core/widgets/custom_grid_view_popular_products.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/features/search/presentation/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: CustomSearchBar(searchController: searchController),
          ),

          Expanded(
            child: CustomGridViewPopularProducts(
              shrinkWrap: false,
              scrollPhysics: false,
            ),
          ),
          // Expanded(child: Center(child: Text('نتائج البحث عن: ""'))),
        ],
      ),
    );
  }
}
