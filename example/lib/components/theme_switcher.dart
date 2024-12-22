import 'package:flutter/material.dart';
import 'package:vit_markdown/data/theme/vit_code_block_style.dart';
import 'package:vit_markdown/data/theme/vit_list_block_style.dart';

import '../theme/theme.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({
    super.key,
    required this.isDarkTheme,
    required this.onSwitch,
  });

  final bool isDarkTheme;
  final void Function(bool themeMode) onSwitch;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Theme'),
        SizedBox(width: 5),
        Switch.adaptive(
          value: isDarkTheme,
          onChanged: (value) {
            if (value) {
              codeStyle = VitCodeBlockStyle.dark();
              listStyle = VitListBlockStyle.dark(
                bulletBuilder: bulletBuilder,
                checkboxBuilder: checkboxBuilder,
              );
            } else {
              codeStyle = VitCodeBlockStyle();
              listStyle = VitListBlockStyle(
                bulletBuilder: bulletBuilder,
                checkboxBuilder: checkboxBuilder,
              );
            }
            onSwitch(value);
          },
        ),
      ],
    );
  }
}
