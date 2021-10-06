import 'package:flutter/material.dart';

import '../shared/app_colors.dart';
import '../shared/ui_helpers.dart';
import '../widgets/app_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText.headingOne(
                "Foodie",
                color: primaryColor,
              ),
              verticalSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}
