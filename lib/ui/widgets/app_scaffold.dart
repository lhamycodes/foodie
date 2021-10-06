import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_text.dart';

class AppScaffold extends StatefulWidget {
  final String title;
  final Widget child;

  const AppScaffold({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: AppText.headingOne(widget.title),
      ),
      body: widget.child,
    );
  }
}
