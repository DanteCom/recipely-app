import 'package:flutter/material.dart';
import 'package:recipely_app/shared/widgets/app_text_styles.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Notifications',
          style: AppTextStyles.s38w700(Colors.black),
        ),
      ),
    );
  }
}
