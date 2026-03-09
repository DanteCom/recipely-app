import 'package:flutter/material.dart';
import 'package:recipely_app/shared/resources/resources.dart';
import 'package:recipely_app/shared/widgets/app_svg_picture.dart';
import 'package:recipely_app/shared/widgets/app_text_styles.dart';

class HomePopularRecipeCard extends StatelessWidget {
  const HomePopularRecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 16,
            offset: Offset(0, 2),
            color: Color(0x30063336),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(Images.food, fit: BoxFit.cover),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      width: 28,
                      height: 28,
                      padding: const EdgeInsets.all(5.5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const AppSvgPicture(Svgs.heartInactive),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Healthy Taco Salad with fresh vegetable',
            style: AppTextStyles.s16w700(const Color(0xFF0A2533)),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const AppSvgPicture(
                Svgs.fire,
                size: 16.0,
                color: Color(0xFF97A2B0),
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  '120 ',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.s14w400(const Color(0xFF97A2B0)),
                ),
              ),
              Text(
                'Kcal',
                style: AppTextStyles.s14w400(const Color(0xFF97A2B0)),
              ),
              Container(
                width: 4,
                height: 4,
                margin: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF97A2B0),
                ),
              ),
              const AppSvgPicture(Svgs.clock, size: 16.0),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  '20 ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.s14w400(const Color(0xFF97A2B0)),
                ),
              ),
              Text(
                'Min',
                style: AppTextStyles.s14w400(const Color(0xFF97A2B0)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
