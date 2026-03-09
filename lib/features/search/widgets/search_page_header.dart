import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipely_app/shared/resources/resources.dart';
import 'package:recipely_app/shared/widgets/app_svg_picture.dart';
import 'package:recipely_app/shared/widgets/app_text_styles.dart';

class SearchPageHeader extends StatelessWidget {
  final double progress;
  final FocusNode focusNode;

  const SearchPageHeader({
    super.key,
    required this.progress,
    required this.focusNode,
  });

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
    final topPadding = MediaQuery.of(context).padding.top;
    final collapse = delayedAnimation(progress, 0.35);

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
                  style: AppTextStyles.s24w700(const Color(0xFF0A2533)),
                ),
                IgnorePointer(
                  ignoring: progress < 1.0,
                  child: Transform.scale(
                    scale: delayedAnimation(collapse, 0.3),
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
                scaleY: 1 - collapse,
                child: Opacity(
                  opacity: 1 - collapse,
                  child: Align(
                    heightFactor: 1 - collapse,
                    alignment: Alignment.lerp(
                      Alignment.bottomCenter,
                      Alignment.topCenter,
                      collapse,
                    )!,
                    child: TextField(
                      focusNode: focusNode,
                      onTapOutside: (event) => focusNode.unfocus(),
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
  }
}
