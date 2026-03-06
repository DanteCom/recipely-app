import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipely_app/shared/resources/resources.dart';
import 'package:recipely_app/shared/widgets/app_svg_picture.dart';
import 'package:recipely_app/shared/widgets/app_text_styles.dart';

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
            delegate: HomePageHeader(
              maxHeight: 57 + topPadding,
              minHeight: 38 + topPadding,
              builder: (context, progress) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20 * progress,
                        offset: Offset(0, 2 * progress),
                        color: const Color(0xFF95A8C3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ).copyWith(top: topPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Opacity(
                              opacity: 1 - progress,
                              child: Align(
                                heightFactor: 1 - progress,
                                child: Row(
                                  spacing: 3,
                                  children: [
                                    const AppSvgPicture(Svgs.sun),
                                    Text(
                                      'Good Morning',
                                      style: AppTextStyles.s14w400(
                                        const Color(0xFF0A2533),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              'Alena Sabyan',
                              style: AppTextStyles.s24w700(
                                const Color(0xFF0A2533),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.lerp(
                            Alignment.topCenter,
                            Alignment.center,
                            progress,
                          )!,
                          child: const AppSvgPicture(Svgs.cart),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 24, bottom: 40 + bottomPadding),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// =========================== Featured ===========================
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
                        itemBuilder: (context, index) => Container(
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
                                    style: AppTextStyles.s14w400(Colors.white),
                                  ),
                                  const Spacer(),
                                  const AppSvgPicture(
                                    Svgs.clock,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '20 Min',
                                    style: AppTextStyles.s14w400(Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    /// =========================== Category ===========================
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category',
                            style: AppTextStyles.s20w700(
                              const Color(0xFF0A2533),
                            ),
                          ),
                          Text(
                            'See All',
                            style: AppTextStyles.s14w700(
                              const Color(0xFF70B9BE),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 41,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 12),
                        itemBuilder: (context, index) => CupertinoButton(
                          color: index == currentCategoryIndex
                              ? const Color(0xFF70B9BE)
                              : const Color(0xFFF1F5F5),
                          borderRadius: BorderRadius.circular(40),
                          padding: const EdgeInsets.symmetric(
                            vertical: 9,
                            horizontal: 24,
                          ),
                          child: Text(
                            categories[index],
                            style: AppTextStyles.s16w400(
                              index == currentCategoryIndex
                                  ? Colors.white
                                  : const Color(0xFF0A2533),
                            ),
                          ),
                          onPressed: () =>
                              setState(() => currentCategoryIndex = index),
                        ),
                      ),
                    ),

                    /// ==================== Popular Recipes ===================
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular Recipes',
                            style: AppTextStyles.s20w700(
                              const Color(0xFF0A2533),
                            ),
                          ),
                          Text(
                            'See All',
                            style: AppTextStyles.s14w700(
                              const Color(0xFF70B9BE),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView.separated(
                        itemCount: 4,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 24,
                        ),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 16),
                        itemBuilder: (context, index) => Container(
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
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Image.asset(
                                  Images.food,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'Healthy Taco Salad with fresh vegetable',
                                style: AppTextStyles.s16w700(
                                  const Color(0xFF0A2533),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
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
                                      style: AppTextStyles.s14w400(
                                        const Color(0xFF97A2B0),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Kcal',
                                    style: AppTextStyles.s14w400(
                                      const Color(0xFF97A2B0),
                                    ),
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
                                      style: AppTextStyles.s14w400(
                                        const Color(0xFF97A2B0),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Min',
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
                    ),
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

class HomePageHeader extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget Function(BuildContext context, double progress) builder;

  const HomePageHeader({
    required this.maxHeight,
    required this.minHeight,
    required this.builder,
  });

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = (shrinkOffset / (maxHeight - minHeight)).clamp(0.0, 1.0);
    return builder(context, progress);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}
