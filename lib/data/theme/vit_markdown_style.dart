import 'package:flutter/material.dart';

import 'vit_code_block_style.dart';
import 'vit_list_style.dart';

class VitMarkdownStyle {
  final TextStyle h1Style;
  final TextStyle h2Style;
  final TextStyle h3Style;
  final TextStyle h4Style;
  final TextStyle h5Style;
  final TextStyle h6Style;

  final TextStyle boldTextStyle;
  final TextStyle italicTextStyle;
  final TextStyle underlineTextStyle;
  final VitListStyle listStyle;
  final VitCodeBlockStyle codeBlockStyle;

  VitMarkdownStyle({
    TextStyle? h1Style,
    TextStyle? h2Style,
    TextStyle? h3Style,
    TextStyle? h4Style,
    TextStyle? h5Style,
    TextStyle? h6Style,
    TextStyle? boldTextStyle,
    TextStyle? italicTextStyle,
    TextStyle? underlineTextStyle,
    VitListStyle? listStyle,
    VitCodeBlockStyle? codeBlockStyle,
  })  : h1Style = h1Style ?? _defaultH1Style(),
        h2Style = h2Style ?? _defaultH2Style(),
        h3Style = h3Style ?? _defaultH3Style(),
        h4Style = h4Style ?? _defaultH4Style(),
        h5Style = h5Style ?? _defaultH5Style(),
        h6Style = h6Style ?? _defaultH6Style(),
        boldTextStyle = boldTextStyle ?? _defaultBoldTextStyle(),
        italicTextStyle = italicTextStyle ?? _defaultItalicTextStyle(),
        underlineTextStyle = underlineTextStyle ?? _defaultUnderlineTextStyle(),
        listStyle = listStyle ?? VitListStyle(),
        codeBlockStyle = VitCodeBlockStyle();

  static TextStyle _defaultH1Style() => const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      );
  static TextStyle _defaultH2Style() => const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      );
  static TextStyle _defaultH3Style() => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );
  static TextStyle _defaultH4Style() => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
  static TextStyle _defaultH5Style() => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );
  static TextStyle _defaultH6Style() => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  static TextStyle _defaultBoldTextStyle() => const TextStyle(
        fontWeight: FontWeight.bold,
      );
  static TextStyle _defaultItalicTextStyle() => const TextStyle(
        fontStyle: FontStyle.italic,
      );
  static TextStyle _defaultUnderlineTextStyle() => const TextStyle(
        decoration: TextDecoration.underline,
      );
}
