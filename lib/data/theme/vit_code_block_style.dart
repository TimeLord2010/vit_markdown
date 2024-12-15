import 'package:flutter/material.dart';

class VitCodeBlockStyle {
  final Color backgroundColor;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BorderRadiusGeometry borderRadius;

  final TextStyle rootTextStyle;
  final TextStyle commentStyle;
  final TextStyle stringStyle;
  final TextStyle keywordStyle;
  final TextStyle controlFlowStyle;
  final TextStyle classIdentifierStyle;
  final TextStyle functionNameStyle;
  final TextStyle variableStyle;

  /// The default style to be applied for the rest of the strings.
  /// Such as separators like "{}", "()" or "=";
  final TextStyle style;

  VitCodeBlockStyle({
    TextStyle? rootTextStyle,
    Color? backgroundColor,
    EdgeInsets? margin,
    EdgeInsets? padding,
    TextStyle? commentStyle,
    TextStyle? stringStyle,
    TextStyle? style,
    TextStyle? classIdentifierStyle,
    TextStyle? controlFlowStyle,
    TextStyle? functionNameStyle,
    TextStyle? keywordStyle,
    TextStyle? variableStyle,
    BorderRadiusGeometry? borderRadius,
  })  : rootTextStyle = rootTextStyle ?? _defaultTextStyle,
        backgroundColor = backgroundColor ?? _defaultBackgroundColor,
        borderRadius =
            borderRadius ?? const BorderRadius.all(Radius.circular(4)),
        margin = margin ?? _defaultMargin,
        padding = padding ?? _defaultPadding,
        commentStyle = commentStyle ?? _defaultCommentStyle,
        stringStyle = stringStyle ?? _defaultStringStyle,
        classIdentifierStyle =
            classIdentifierStyle ?? _defaultClassIdentifierStyle,
        controlFlowStyle = controlFlowStyle ?? _defaultControlFlowStyle,
        functionNameStyle = functionNameStyle ?? _defaultFunctionStyle,
        keywordStyle = keywordStyle ?? _defaultKeywordStyle,
        variableStyle = variableStyle ?? _defaultVariableStyle,
        style = style ?? _defaultStyle;

  factory VitCodeBlockStyle.dark({
    TextStyle? rootTextStyle,
    Color? backgroundColor,
    EdgeInsets? margin,
    EdgeInsets? padding,
    TextStyle? commentStyle,
    TextStyle? stringStyle,
    TextStyle? style,
    TextStyle? classIdentifierStyle,
    TextStyle? controlFlowStyle,
    TextStyle? functionNameStyle,
    TextStyle? keywordStyle,
    TextStyle? variableStyle,
  }) {
    return VitCodeBlockStyle(
      margin: margin ?? _defaultMargin,
      padding: padding ?? _defaultPadding,
      backgroundColor: backgroundColor ?? const Color.fromARGB(255, 29, 29, 29),
      classIdentifierStyle: classIdentifierStyle ??
          const TextStyle(
            color: Color.fromARGB(255, 66, 189, 162),
          ),
      commentStyle: commentStyle ??
          const TextStyle(
            color: Color.fromARGB(255, 93, 139, 74),
          ),
      controlFlowStyle: controlFlowStyle ??
          const TextStyle(
            color: Color.fromARGB(255, 190, 123, 184),
          ),
      functionNameStyle: functionNameStyle ??
          const TextStyle(
            color: Color.fromARGB(255, 215, 215, 160),
          ),
      keywordStyle: keywordStyle ??
          const TextStyle(
            color: Color.fromARGB(255, 74, 141, 201),
          ),
      rootTextStyle: rootTextStyle ??
          const TextStyle(
            color: Color.fromARGB(255, 143, 212, 251),
          ),
      stringStyle: stringStyle ??
          const TextStyle(
            color: Color.fromARGB(255, 200, 134, 109),
          ),
      style: style ??
          const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
      variableStyle: variableStyle ??
          const TextStyle(
            color: Color.fromARGB(255, 143, 212, 251),
          ),
    );
  }

  static TextStyle get _defaultTextStyle {
    return const TextStyle(
      fontFamily: 'monospace',
      fontSize: 14,
    );
  }

  static Color get _defaultBackgroundColor {
    return const Color.fromARGB(255, 253, 253, 253);
  }

  static EdgeInsets get _defaultMargin => const EdgeInsets.all(8.0);

  static EdgeInsets get _defaultPadding => const EdgeInsets.all(8.0);

  static TextStyle get _defaultCommentStyle {
    return const TextStyle(
      color: Color.fromARGB(255, 76, 175, 79),
    );
  }

  static TextStyle get _defaultStringStyle {
    return const TextStyle(color: Color.fromARGB(255, 244, 67, 54));
  }

  static TextStyle get _defaultStyle {
    return const TextStyle(color: Color.fromARGB(255, 0, 0, 0));
  }

  static TextStyle get _defaultKeywordStyle {
    return const TextStyle(
      color: Colors.blue,
    );
  }

  static TextStyle get _defaultControlFlowStyle {
    return const TextStyle(
      color: Color.fromARGB(255, 171, 22, 217),
    );
  }

  static TextStyle get _defaultVariableStyle {
    return const TextStyle(
      color: Color.fromARGB(255, 13, 30, 124),
    );
  }

  static TextStyle get _defaultClassIdentifierStyle {
    return const TextStyle(
      color: Color.fromARGB(255, 33, 116, 142),
    );
  }

  static TextStyle get _defaultFunctionStyle {
    return const TextStyle(
      color: Color.fromARGB(255, 110, 83, 34),
    );
  }
}
