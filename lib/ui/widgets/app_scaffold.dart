import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie/ui/shared/app_colors.dart';

import 'app_text.dart';

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
          onTap: () => widget.onBackTap,
          child: Container(
            margin: const EdgeInsets.only(left: 22, top: 5, bottom: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: primaryColor.withOpacity(0.2),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.arrow_back),
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
        title: AppText.headingTwo(widget.title),
      ),
      body: widget.child,
    );
  }
}
