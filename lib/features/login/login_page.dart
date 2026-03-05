import 'package:flutter/material.dart';
import 'package:recipely_app/shared/widgets/app_text_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Login', style: AppTextStyles.s38w700(Colors.black)),
      ),
    );
  }
}
