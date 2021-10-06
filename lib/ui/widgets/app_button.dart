import 'package:flutter/material.dart';
import '../shared/app_colors.dart';

class AppButton extends StatefulWidget {
  final bool busy;
  final String title;
  final void Function()? onPressed;
  final bool enabled;
  final Color color;
  final Color titleColor;
  final EdgeInsets padding;
  final double borderRadius;
  final BorderSide borderSide;
  final bool hasElevation;

  const AppButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.busy = false,
    this.enabled = true,
    this.color = primaryColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
    this.titleColor = Colors.white,
    this.borderRadius = 10,
    this.borderSide = BorderSide.none,
    this.hasElevation = true,
  }) : super(key: key);

  @override
  AppButtonState createState() => AppButtonState();
}

class AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return !widget.busy
        ? ElevatedButton(
            onPressed: widget.busy
                ? () {}
                : widget.enabled
                    ? widget.onPressed
                    : () {},
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: widget.titleColor,
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                side: widget.borderSide,
              ),
              elevation: !widget.hasElevation ? 0 : null,
              primary:
                  widget.enabled ? widget.color : widget.color.withOpacity(0.5),
              padding: widget.padding,
            ),
          )
        : Center(
            child: Container(
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(10),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(widget.titleColor),
              ),
            ),
          );
  }
}
