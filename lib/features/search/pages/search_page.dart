import 'package:flutter/material.dart';
import 'package:recipely_app/shared/widgets/app_sliver_header_delegate.dart';
import 'package:recipely_app/features/search/widgets/search_page_header.dart';
import 'package:recipely_app/features/search/widgets/search_categories_section.dart';
import 'package:recipely_app/features/search/widgets/search_editors_choice_section.dart';
import 'package:recipely_app/features/search/widgets/search_popular_recipes_section.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int currentCategoryIndex = 0;

  double get maxHeight => 120 + topPadding;
  double get minHeight => 40 + topPadding;

  double get topPadding => MediaQuery.of(context).padding.top;
  double get bottomPadding => MediaQuery.of(context).padding.bottom;

  final searchFocusNode = FocusNode();
  final categories = <String>['Breakfast', 'Lunch', 'Dinner', 'Snack'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: AppSliverHeaderDelegate(
              maxHeight: maxHeight,
              minHeight: minHeight,
              builder: (context, progress) => SearchPageHeader(
                progress: progress,
                focusNode: searchFocusNode,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 10, bottom: 40 + bottomPadding),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 16),
                SearchCategoriesSection(
                  categories: categories,
                  currentIndex: currentCategoryIndex,
                  onTap: (index) =>
                      setState(() => currentCategoryIndex = index),
                ),
                const SizedBox(height: 24),
                const SearchPopularRecipesSection(),
                const SizedBox(height: 24),
                const SearchEditorsChoiceSection(),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
