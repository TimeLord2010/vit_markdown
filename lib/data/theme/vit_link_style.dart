import 'package:flutter/material.dart';

class LinkStyle {
  final TextStyle textStyle;
  final void Function(String url)? onTap;

  LinkStyle({
    TextStyle? textStyle,
    this.onTap,
  }) : textStyle = textStyle ?? _defaultLinkTextStyle();

  static TextStyle _defaultLinkTextStyle() => const TextStyle(
        color: Colors.blue,
        decoration: TextDecoration.underline,
      );
}
