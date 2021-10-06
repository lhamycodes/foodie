import 'package:flutter/material.dart';
import '../shared/app_colors.dart';

class Input extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final TextInputType inputType;
  final TextEditingController? textController;
  final String? label;
  final String? hintText;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool fullBorder;
  final bool filled;
  final int? maxLines;
  final int minLines;
  final TextInputAction keyboardAction;
  final FocusNode? focusNode;
  final String Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final void Function(String?)? onChanged;
  final void Function(String?)? onFieldSubmitted;
  final void Function()? onEditComplete;
  final Color borderColor,
      enabledBorderColor,
      errorBorderColor,
      labelColor,
      textColor,
      fillColor,
      errorTextColor,
      hintTextColor;
  final bool showLabel;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final double borderRadius;

  const Input({
    Key? key,
    this.label,
    required this.hintText,
    this.initialValue,
    this.textController,
    this.inputType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.filled = false,
    this.fullBorder = true,
    this.maxLines,
    this.minLines = 1,
    this.keyboardAction = TextInputAction.next,
    this.focusNode,
    this.validator,
    this.onSaved,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditComplete,
    this.borderColor = primaryColor,
    this.enabledBorderColor = Colors.black12,
    this.errorBorderColor = Colors.red,
    this.labelColor = Colors.black,
    this.textColor = Colors.black,
    this.hintTextColor = Colors.black38,
    this.errorTextColor = Colors.red,
    this.fillColor = inputFillColor,
    this.showLabel = true,
    this.textStyle,
    this.textAlign = TextAlign.start,
    this.borderRadius = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      textAlign: textAlign,
      decoration: InputDecoration(
        contentPadding: !fullBorder
            ? null
            : const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: showLabel ? label : null,
        labelStyle: TextStyle(
          color: labelColor,
          fontSize: 18,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: fullBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : const UnderlineInputBorder(),
        focusedBorder: fullBorder
            ? OutlineInputBorder(
                borderSide: const BorderSide(color: primaryColor),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
        errorBorder: fullBorder
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorBorderColor,
                  width: 1.0,
                ),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(
                  color: errorBorderColor,
                  width: 1.0,
                ),
              ),
        enabledBorder: fullBorder
            ? OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black12,
                ),
              ),
        filled: filled,
        hintStyle: TextStyle(
          color: hintTextColor,
        ),
        hintText: hintText,
        fillColor: fillColor,
        errorStyle: TextStyle(
          color: errorTextColor,
          fontSize: 14,
        ),
      ),
      style: textStyle ?? TextStyle(color: textColor),
      enabled: enabled,
      obscureText: obscureText,
      readOnly: readOnly,
      keyboardType: minLines > 1 ? TextInputType.multiline : inputType,
      textInputAction: keyboardAction,
      validator: validator,
      onSaved: onSaved,
      focusNode: focusNode,
      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      controller: textController,
      onEditingComplete: onEditComplete,
      maxLines: obscureText ? 1 : maxLines,
      minLines: minLines,
    );
  }
}
