import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipely_app/shared/resources/resources.dart';
import 'package:recipely_app/shared/widgets/app_svg_picture.dart';
import 'package:recipely_app/shared/widgets/app_text_styles.dart';

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

  double delayedAnimation(double progress, double start) {
    return ((progress - start) / (1 - start)).clamp(0.0, 1.0);
  }

  double earlyAnimation(double progress, double end) {
    return (progress / end).clamp(0.0, 1.0);
  }

  double rangeAnimation(double progress, double start, double end) {
    return ((progress - start) / (end - start)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: SearchPageHeader(
              maxHeight: maxHeight,
              minHeight: minHeight,
              builder: (context, progress) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20 * delayedAnimation(progress, 0.4),
                        offset: Offset(0, 2 * delayedAnimation(progress, 0.4)),
                        color: const Color(0xFF95A8C3),
                      ),
                    ],
                  ),
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(top: topPadding),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 20),
                            Text(
                              'Search',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.s24w700(
                                const Color(0xFF0A2533),
                              ),
                            ),
                            IgnorePointer(
                              ignoring: progress < 1.0,
                              child: Transform.scale(
                                scale: delayedAnimation(progress, 0.3),
                                child: CupertinoButton(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  child: const AppSvgPicture(
                                    size: 20,
                                    Svgs.searchInactive,
                                    color: Color(0xFF0A2533),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        IgnorePointer(
                          ignoring: progress > 0.0,
                          child: Transform.scale(
                            scaleY: 1 - rangeAnimation(progress, 0.35, 0.9),
                            child: Opacity(
                              opacity: 1 - rangeAnimation(progress, 0.5, 0.9),
                              child: Align(
                                heightFactor:
                                    1 - rangeAnimation(progress, 0.3, 1.0),
                                alignment: Alignment.lerp(
                                  Alignment.bottomCenter,
                                  Alignment.topCenter,
                                  progress,
                                )!,
                                child: TextField(
                                  focusNode: searchFocusNode,
                                  onTapOutside: (event) =>
                                      searchFocusNode.unfocus(),
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    hintStyle: AppTextStyles.s16w400(
                                      const Color(0xFF97A2B0),
                                    ),
                                    prefixIcon: const Padding(
                                      padding: EdgeInsets.all(16),
                                      child: AppSvgPicture(
                                        Svgs.searchInactive,
                                        color: Color(0xFF0A2533),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                        width: 2,
                                        color: Color(0xFFE6EBF2),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                        width: 2,
                                        color: Color(0xFFE6EBF2),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 10, bottom: 40 + bottomPadding),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 16),
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
                const SizedBox(height: 24),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    itemBuilder: (context, index) => Container(
                      width: 100,
                      padding: const EdgeInsets.all(8).copyWith(bottom: 12),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 84,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Image.asset(Images.food, fit: BoxFit.cover),
                          ),
                          Text(
                            'Egg & Avosadas',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.s16w400(
                              const Color(0xFF0A2533),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
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
                                  style: AppTextStyles.s16w700(
                                    const Color(0xFF0A2533),
                                  ),
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
                        CupertinoButton(
                          color: const Color(0xFF042628),
                          borderRadius: BorderRadius.circular(16),
                          padding: const EdgeInsets.all(5),
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
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchPageHeader extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget Function(BuildContext context, double progress) builder;

  const SearchPageHeader({
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
