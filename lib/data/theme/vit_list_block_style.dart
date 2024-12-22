import 'package:flutter/widgets.dart';

import '../enums/markdown_list_type.dart';
import 'theme_colors.dart';

class VitListBlockStyle {
  final Color backgroundColor;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final TextStyle? textStyle;
  final double indentSize;
  final double verticalSpacing;
  final Widget Function(Color textColor, MarkdownListType type, String preffix)?
      bulletBuilder;
  final Widget Function(bool? isChecked)? checkboxBuilder;

  VitListBlockStyle({
    this.textStyle,
    double? indentSize,
    double? verticalSpacing,
    this.bulletBuilder,
    this.checkboxBuilder,
    EdgeInsets? padding,
    EdgeInsets? margin,
    Color? backgroundColor,
    BorderRadiusGeometry? borderRadius,
  })  : backgroundColor = backgroundColor ?? ThemeColors.light.backgroundColor,
        padding = padding ?? const EdgeInsets.all(8),
        margin = margin ?? const EdgeInsets.all(8),
        indentSize = indentSize ?? 8,
        verticalSpacing = verticalSpacing ?? 4,
        borderRadius = borderRadius ?? BorderRadius.circular(4);

  factory VitListBlockStyle.dark({
    EdgeInsets? padding,
    EdgeInsets? margin,
    Color? backgroundColor,
    TextStyle? textStyle,
    double? indentSize,
    double? verticalSpacing,
    Widget Function(Color textColor, MarkdownListType type, String preffix)?
        bulletBuilder,
    Widget Function(bool? isChecked)? checkboxBuilder,
  }) {
    return VitListBlockStyle(
      backgroundColor: backgroundColor ?? ThemeColors.dark.backgroundColor,
      padding: padding,
      margin: margin,
      textStyle: textStyle ??
          TextStyle(
            color: ThemeColors.dark.textColor,
          ),
      indentSize: indentSize,
      verticalSpacing: verticalSpacing,
      bulletBuilder: bulletBuilder,
      checkboxBuilder: checkboxBuilder,
    );
  }
}
