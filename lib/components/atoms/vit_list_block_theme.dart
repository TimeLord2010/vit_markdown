import 'dart:ui';

import 'package:flutter/widgets.dart';

import '../../data/theme/vit_list_block_style.dart';

class VitListBlockTheme extends InheritedWidget {
  final VitListBlockStyle lightStyle;
  final VitListBlockStyle darkStyle;

  const VitListBlockTheme({
    super.key,
    required this.lightStyle,
    required this.darkStyle,
    required super.child,
  });

  static VitListBlockStyle of(BuildContext context) {
    var provider =
        context.dependOnInheritedWidgetOfExactType<VitListBlockTheme>();
    var brightness = MediaQuery.platformBrightnessOf(context);
    if (brightness == Brightness.dark) {
      return provider?.darkStyle ?? VitListBlockStyle.dark();
    }
    return provider?.lightStyle ?? VitListBlockStyle();
  }

  @override
  bool updateShouldNotify(VitListBlockTheme oldWidget) {
    return lightStyle != oldWidget.lightStyle;
  }
}
