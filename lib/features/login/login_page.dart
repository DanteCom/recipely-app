import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipely_app/shared/resources/resources.dart';
import 'package:recipely_app/shared/widgets/app_text_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF70B9BE),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Images.splashForeground, fit: BoxFit.cover),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      onPressed: () {},
                      child: Text(
                        'Later',
                        style: AppTextStyles.s18w700(Colors.white),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsGeometry.all(24),
                  child: Column(
                    children: [
                      Text(
                        'Help your path to health goals with happiness',
                        style: AppTextStyles.s28w700(Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: CupertinoButton(
                          color: const Color(0xFF042628),
                          borderRadius: BorderRadius.circular(16),
                          child: Text(
                            'Login',
                            style: AppTextStyles.s16w700(Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 8),
                      CupertinoButton(
                        onPressed: () {},
                        child: Text(
                          'Create New Account',
                          style: AppTextStyles.s16w700(Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
