import 'package:flutter/material.dart';

import '../shared/app_colors.dart';
import '../shared/app_styles.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign alignment;

  AppText.headingOne(
    this.text, {
    Color? color,
    TextAlign align = TextAlign.start,
    Key? key,
  })  : style = heading1Style.copyWith(color: color),
        alignment = align,
        super(key: key);

  const AppText.headingTwo(
    this.text, {
    TextAlign align = TextAlign.start,
    Key? key,
  })  : style = heading2Style,
        alignment = align,
        super(key: key);

  AppText.headingThree(
    this.text, {
    TextAlign align = TextAlign.start,
    Key? key,
  })  : style = heading3Style.copyWith(
          fontWeight: FontWeight.w500,
        ),
        alignment = align,
        super(key: key);

  const AppText.headline(
    this.text, {
    TextAlign align = TextAlign.start,
    Key? key,
  })  : style = headlineStyle,
        alignment = align,
        super(key: key);

  const AppText.subheading(
    this.text, {
    TextAlign align = TextAlign.start,
    Key? key,
  })  : style = subheadingStyle,
        alignment = align,
        super(key: key);

  const AppText.caption(
    this.text, {
    TextAlign align = TextAlign.start,
    Key? key,
  })  : style = captionStyle,
        alignment = align,
        super(key: key);

  AppText.body(
    this.text, {
    Color color = bodyTextColor,
    TextAlign align = TextAlign.start,
    Key? key,
  })  : style = bodyStyle.copyWith(color: color),
        alignment = align,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: alignment,
    );
  }
}
