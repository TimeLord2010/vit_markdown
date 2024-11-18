import 'package:flutter/widgets.dart';

class VitListStyle {
  final TextStyle textStyle;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double spacing;
  final Widget? leadingWidget;

  VitListStyle({
    TextStyle? textStyle,
    EdgeInsets? margin,
    EdgeInsets? padding,
    double? spacing,
    Widget? leadingWidget,
  })  : textStyle = textStyle ?? _defaultTextStyle(),
        margin = margin ?? _defaultMargin(),
        padding = padding ?? _defaultPadding(),
        spacing = spacing ?? _defaultSpacing(),
        leadingWidget = leadingWidget ?? _defaultLeadingWidget();

  static TextStyle _defaultTextStyle() => const TextStyle(fontSize: 16);

  static EdgeInsets _defaultMargin() => const EdgeInsets.all(8.0);

  static EdgeInsets _defaultPadding() => const EdgeInsets.all(8.0);

  static double _defaultSpacing() => 4.0;

  static Widget _defaultLeadingWidget() => Container(
        width: 5,
        height: 5,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
          shape: BoxShape.circle,
        ),
      );
}
