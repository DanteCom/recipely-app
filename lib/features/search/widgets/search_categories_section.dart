import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipely_app/shared/widgets/app_text_styles.dart';

class SearchCategoriesSection extends StatelessWidget {
  final List<String> categories;
  final int currentIndex;
  final void Function(int index) onTap;

  const SearchCategoriesSection({
    super.key,
    required this.categories,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) => CupertinoButton(
          color: index == currentIndex
              ? const Color(0xFF70B9BE)
              : const Color(0xFFF1F5F5),
          borderRadius: BorderRadius.circular(40),
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 24),
          child: Text(
            categories[index],
            style: AppTextStyles.s16w400(
              index == currentIndex ? Colors.white : const Color(0xFF0A2533),
            ),
          ),
          onPressed: () => onTap(index),
        ),
      ),
    );
  }
}
