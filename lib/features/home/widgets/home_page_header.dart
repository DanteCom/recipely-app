
import 'package:flutter/material.dart';
import 'package:recipely_app/shared/resources/resources.dart';
import 'package:recipely_app/shared/widgets/app_svg_picture.dart';
import 'package:recipely_app/shared/widgets/app_text_styles.dart';

class HomePageHeader extends StatelessWidget {
  final double progress;

  const HomePageHeader(this.progress, {super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
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
                          style: AppTextStyles.s14w400(const Color(0xFF0A2533)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Alena Sabyan',
                  style: AppTextStyles.s24w700(const Color(0xFF0A2533)),
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
  }
}
