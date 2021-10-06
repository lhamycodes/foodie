import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_text.dart';
import 'border_widget.dart';

class AppScaffold extends StatefulWidget {
  final String title;
  final Widget child;
  final void Function()? onBackTap;
  final Widget? trailing;

  const AppScaffold({
    Key? key,
    required this.title,
    required this.child,
    this.onBackTap,
    this.trailing,
  }) : super(key: key);

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 65,
        centerTitle: true,
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (widget.onBackTap != null) {
              widget.onBackTap!();
            }
          },
          child: const BorderWidget(
            child: Icon(Icons.arrow_back),
          ),
        ),
        actions: widget.trailing != null
            ? [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: widget.trailing,
                ),
              ]
            : null,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: AppText.headingThree(widget.title),
      ),
      body: widget.child,
    );
  }
}
