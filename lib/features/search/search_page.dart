import 'package:flutter/material.dart';
import 'package:recipely_app/shared/widgets/app_text_styles.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Search', style: AppTextStyles.s38w700(Colors.black)),
      ),
    );
  }
}
