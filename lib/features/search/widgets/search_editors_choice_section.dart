import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipely_app/shared/resources/resources.dart';
import 'package:recipely_app/shared/widgets/app_svg_picture.dart';
import 'package:recipely_app/shared/widgets/app_text_styles.dart';

class SearchEditorsChoiceSection extends StatelessWidget {
  const SearchEditorsChoiceSection({super.key});

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
                'Editor’s Choice',
                style: AppTextStyles.s20w700(const Color(0xFF0A2533)),
              ),
              Text(
                'View All',
                style: AppTextStyles.s14w700(const Color(0xFF70B9BE)),
              ),
            ],
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: 4,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.all(8).copyWith(right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 16,
                  offset: Offset(0, 2),
                  color: Color(0x30063336),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 100,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(Images.food, fit: BoxFit.cover),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Easy homemade beef burger',
                          style: AppTextStyles.s16w700(const Color(0xFF0A2533)),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              padding: const EdgeInsets.all(1),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF97A2B0),
                              ),
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  Images.avocado,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'James Spader',
                              style: AppTextStyles.s14w400(
                                const Color(0xFF97A2B0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CupertinoButton(
                  minimumSize: Size.zero,
                  color: const Color(0xFF042628),
                  padding: const EdgeInsets.all(5),
                  borderRadius: BorderRadius.circular(8),
                  child: const AppSvgPicture(
                    Svgs.arrowRight,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
