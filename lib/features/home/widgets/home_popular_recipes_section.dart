import 'package:flutter/material.dart';
import 'package:recipely_app/shared/widgets/app_text_styles.dart';
import 'package:recipely_app/features/home/widgets/home_popular_recipe_card.dart';

class PopularRecipesSection extends StatelessWidget {
  const PopularRecipesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Recipes',
                style: AppTextStyles.s20w700(const Color(0xFF0A2533)),
              ),
              Text(
                'See All',
                style: AppTextStyles.s14w700(const Color(0xFF70B9BE)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 264,
          child: ListView.separated(
            itemCount: 4,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) => const HomePopularRecipeCard(),
          ),
        ),
      ],
    );
  }
}
