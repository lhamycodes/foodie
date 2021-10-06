// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

import '../../locator.dart';
import '../../viewmodels/application_view_model.dart';
import '../shared/app_styles.dart';
import '../widgets/app_scaffold.dart';

class TrackOrderScreen extends StatefulWidget {
  static const routeName = '/app/order/track';

  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  _TrackOrderScreenState createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ApplicationViewModel>.withConsumer(
      viewModelBuilder: () => locator<ApplicationViewModel>(),
      disposeViewModel: false,
      builder: (context, model, child) {
        return AppScaffold(
          title: "Track Order 📦",
          onBackTap: () => model.goBack(),
          child: Container(
            padding: scaffoldPadding,
          ),
        );
      },
    );
  }
}
