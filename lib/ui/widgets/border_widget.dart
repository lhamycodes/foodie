import 'package:flutter/material.dart';
import '../shared/app_colors.dart';

class BorderWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  const BorderWidget({
    Key? key,
    required this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 22, top: 5, bottom: 5),
      alignment: Alignment.center,
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColor.withOpacity(0.2),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
