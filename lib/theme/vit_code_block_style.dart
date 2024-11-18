import 'package:flutter/material.dart';

class VitCodeBlockStyle {
  final TextStyle textStyle;
  final Color backgroundColor;
  final EdgeInsets margin;
  final EdgeInsets padding;

  VitCodeBlockStyle({
    TextStyle? textStyle,
    Color? backgroundColor,
    EdgeInsets? margin,
    EdgeInsets? padding,
  })  : textStyle = textStyle ?? _defaultTextStyle(),
        backgroundColor = backgroundColor ?? _defaultBackgroundColor(),
        margin = margin ?? _defaultMargin(),
        padding = padding ?? _defaultPadding();

  static TextStyle _defaultTextStyle() => const TextStyle(
        fontFamily: 'monospace',
        fontSize: 14,
      );

  static Color _defaultBackgroundColor() => Colors.grey.shade200;

  static EdgeInsets _defaultMargin() => const EdgeInsets.all(8.0);

  static EdgeInsets _defaultPadding() => const EdgeInsets.all(8.0);
}
