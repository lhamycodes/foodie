// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

import '../../locator.dart';
import '../../viewmodels/application_view_model.dart';
import '../shared/app_colors.dart';
import '../shared/ui_helpers.dart';
import '../widgets/app_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ApplicationViewModel>.withConsumer(
      viewModelBuilder: () => locator<ApplicationViewModel>(),
      onModelReady: (model) => model.handleSplashLogic(),
      disposeViewModel: false,
      builder: (context, model, child) {
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
                  verticalSpace(20),
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
