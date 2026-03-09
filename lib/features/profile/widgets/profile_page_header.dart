import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipely_app/shared/resources/resources.dart';
import 'package:recipely_app/shared/widgets/app_svg_picture.dart';
import 'package:recipely_app/shared/widgets/app_text_styles.dart';

class ProfilePageHeader extends StatelessWidget {
  final double hPadding;
  final double progress;
  const ProfilePageHeader({
    super.key,
    required this.hPadding,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    const minAvatarSize = 50.0;

    final width = MediaQuery.of(context).size.width;
    final topPadding = MediaQuery.of(context).padding.top;

    double earlyAnimation(double progress, double end) {
      return (progress / end).clamp(0.0, 1.0);
    }

    double delayedAnimation(double progress, double start) {
      return ((progress - start) / (1 - start)).clamp(0.0, 1.0);
    }

    final arrowBtnHide = earlyAnimation(progress, 0.35);

    final collapse = earlyAnimation(progress, 0.6);

    final titleProgress = delayedAnimation(progress, 0.6);

    final shadowProgress = delayedAnimation(progress, 0.8);

    final borderRadius = BorderRadius.lerp(
      BorderRadius.circular(16),
      BorderRadius.circular(40),
      progress,
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: hPadding,
      ).copyWith(top: topPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20 * shadowProgress,
            offset: Offset(0, 2 * shadowProgress),
            color: const Color(0xFF95A8C3),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.lerp(
              Alignment.topLeft,
              Alignment.center,
              titleProgress,
            )!,
            child: Text(
              'Account',
              style: AppTextStyles.s24w700(const Color(0xFF0A2533)),
            ),
          ),
          Align(
            alignment: Alignment.lerp(
              Alignment.topRight,
              Alignment.centerRight,
              titleProgress,
            )!,
            child: const AppSvgPicture(Svgs.settings),
          ),
          Align(
            alignment: Alignment.lerp(
              Alignment.bottomLeft,
              Alignment.topLeft,
              delayedAnimation(progress, 0.8),
            )!,
            child: CupertinoButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              child: Container(
                clipBehavior: Clip.antiAlias,
                height: lerpDouble(80, minAvatarSize, collapse),
                width: lerpDouble(width, minAvatarSize, collapse),
                padding: EdgeInsets.all(
                  lerpDouble(16, 1, earlyAnimation(collapse, 0.6))!,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: borderRadius,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 16,
                      offset: Offset(0.0, 2.0),
                      color: Color(0x30063336),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF70B9BE),
                      ),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: Image.asset(Images.avocado, fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: lerpDouble(16.0, 0.0, collapse)),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Alena Sabyan',
                                  style: AppTextStyles.s18w700(
                                    const Color(0xFF0A2533),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'Recipe Developer',
                                  style: AppTextStyles.s14w700(
                                    const Color(0xFF48525F),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Opacity(
                            opacity: 1 - arrowBtnHide,
                            child: Align(
                              widthFactor: 1 - arrowBtnHide,
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF353535),
                                  borderRadius: BorderRadius.circular(8),
                                ),

                                child: const AppSvgPicture(
                                  Svgs.arrowRight,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
