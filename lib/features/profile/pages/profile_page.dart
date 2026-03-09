import 'package:flutter/material.dart';
import 'package:recipely_app/shared/resources/resources.dart';
import 'package:recipely_app/shared/widgets/app_svg_picture.dart';
import 'package:recipely_app/shared/widgets/app_text_styles.dart';
import 'package:recipely_app/shared/widgets/app_sliver_header_delegate.dart';
import 'package:recipely_app/features/profile/widgets/profile_page_header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final horizontalPadding = 24.0;
  double get maxHeight => 150 + topPadding;
  double get minHeight => 60 + topPadding;

  double get topPadding => MediaQuery.of(context).padding.top;

  double get bottomPadding => MediaQuery.of(context).padding.bottom;

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
              builder: (context, progress) => ProfilePageHeader(
                hPadding: horizontalPadding,
                progress: progress,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(
              24,
            ).copyWith(bottom: 40 + bottomPadding),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Favorites',
                      style: AppTextStyles.s20w700(const Color(0xFF0A2533)),
                    ),
                    Text(
                      'See All',
                      style: AppTextStyles.s14w700(const Color(0xFF70B9BE)),
                    ),
                  ],
                ),
                GridView.builder(
                  itemCount: 8,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 200,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                  ),
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 16,
                          offset: Offset(0.0, 2.0),
                          color: Color(0x30063336),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  top: 10,
                                  right: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(5.5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const AppSvgPicture(
                                      Svgs.heartActive,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Sunny Egg & Toast Avocado',
                          style: AppTextStyles.s16w700(const Color(0xFF0A2533)),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              padding: const EdgeInsets.all(1),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF70B9BE),
                              ),
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  Images.chips,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Alice Fala',
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
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
