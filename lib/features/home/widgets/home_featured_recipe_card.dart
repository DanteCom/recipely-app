import 'package:flutter/material.dart';
import 'package:recipely_app/shared/resources/resources.dart';
import 'package:recipely_app/shared/widgets/app_svg_picture.dart';
import 'package:recipely_app/shared/widgets/app_text_styles.dart';

class HomeFeaturedRecipeCard extends StatelessWidget {
  const HomeFeaturedRecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 264,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Images.featuredBackground),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Asian white noodle with extra seafood',
            maxLines: 2,
            style: AppTextStyles.s18w700(Colors.white),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(1.5),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(Images.avocado, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 8),
              Text('James Spader', style: AppTextStyles.s14w400(Colors.white)),
              const Spacer(),
              const AppSvgPicture(Svgs.clock, color: Colors.white),
              const SizedBox(width: 5),
              Text('20 Min', style: AppTextStyles.s14w400(Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
