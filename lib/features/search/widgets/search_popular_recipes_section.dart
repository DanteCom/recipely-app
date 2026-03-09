import 'package:flutter/material.dart';
import 'package:recipely_app/shared/resources/resources.dart';
import 'package:recipely_app/shared/widgets/app_text_styles.dart';

class SearchPopularRecipesSection extends StatelessWidget {
  const SearchPopularRecipesSection({super.key});

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
                'View All',
                style: AppTextStyles.s14w700(const Color(0xFF70B9BE)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 160,
          child: ListView.separated(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) => Container(
              width: 100,
              padding: const EdgeInsets.all(8).copyWith(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 16,
                    offset: Offset(0, 0.0),
                    color: Color(0x30063336),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset(Images.food, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Egg & Avosadas',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.s16w400(const Color(0xFF0A2533)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
