// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

import '../../locator.dart';
import '../../viewmodels/application_view_model.dart';
import '../shared/app_styles.dart';
import '../widgets/app_scaffold.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/app/cart';

  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ApplicationViewModel>.withConsumer(
      viewModelBuilder: () => locator<ApplicationViewModel>(),
      builder: (context, model, child) {
        return const AppScaffold(
          title: "Cart",
          child: SingleChildScrollView(
            padding: scaffoldPadding,
          ),
        );
      },
    );
  }
}
