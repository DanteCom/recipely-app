import 'package:flutter/material.dart';
import 'widgets/home_categories_section.dart';
import 'widgets/home_featured_recipe_card.dart';
import 'widgets/home_popular_recipes_section.dart';
import 'package:recipely_app/shared/widgets/app_text_styles.dart';
import 'package:recipely_app/features/home/widgets/home_page_header.dart';
import 'package:recipely_app/shared/widgets/app_sliver_header_delegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCategoryIndex = 0;

  double get topPadding => MediaQuery.of(context).padding.top;
  double get bottomPadding => MediaQuery.of(context).padding.bottom;

  final categories = <String>['Breakfast', 'Lunch', 'Dinner', 'Snack'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: AppSliverHeaderDelegate(
              maxHeight: 57 + topPadding,
              minHeight: 38 + topPadding,
              builder: (context, progress) => HomePageHeader(progress),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 24, bottom: 40 + bottomPadding),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        'Featured',
                        style: AppTextStyles.s20w700(const Color(0xFF0A2533)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 178,
                      child: ListView.separated(
                        itemCount: 4,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 16),
                        itemBuilder: (context, index) =>
                            const HomeFeaturedRecipeCard(),
                      ),
                    ),

                    const SizedBox(height: 24),
                    HomeCategoriesSection(
                      categories: categories,
                      currentIndex: currentCategoryIndex,
                      onTap: (index) =>
                          setState(() => currentCategoryIndex = index),
                    ),
                    const SizedBox(height: 24),
                    const PopularRecipesSection(),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
