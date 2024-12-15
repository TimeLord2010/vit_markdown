import 'dart:ui';

import 'package:flutter/widgets.dart';

import '../../data/theme/vit_code_block_style.dart';

class VitCodeBlockTheme extends InheritedWidget {
  final VitCodeBlockStyle lightStyle;
  final VitCodeBlockStyle darkStyle;

  const VitCodeBlockTheme({
    super.key,
    required this.lightStyle,
    required this.darkStyle,
    required super.child,
  });

  static VitCodeBlockStyle of(BuildContext context) {
    var provider =
        context.dependOnInheritedWidgetOfExactType<VitCodeBlockTheme>();
    var brightness = MediaQuery.platformBrightnessOf(context);
    if (brightness == Brightness.dark) {
      return provider?.darkStyle ?? VitCodeBlockStyle.dark();
    }
    return provider?.lightStyle ?? VitCodeBlockStyle();
  }

  @override
  bool updateShouldNotify(VitCodeBlockTheme oldWidget) {
    return lightStyle != oldWidget.lightStyle;
  }
}
