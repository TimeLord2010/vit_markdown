import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vit_markdown/components/atoms/vit_code_block.dart';
import 'package:vit_markdown/components/atoms/vit_list_block.dart';
import 'package:vit_markdown/components/atoms/vit_table_block.dart';
import 'package:vit_markdown/data/enums/markdown_list_type.dart';
import 'package:vit_markdown/data/theme/vit_code_block_style.dart';
import 'package:vit_markdown/data/theme/vit_list_block_style.dart';
import 'package:vit_markdown/data/theme/vit_table_block_style.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isDarkTheme = true;

  var checkboxBuilder = (isChecked) {
    return Container(
      width: 16,
      height: 16,
      margin: EdgeInsets.only(right: 5),
      child: Checkbox.adaptive(
        value: isChecked,
        onChanged: (v) {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
      ),
    );
  };
  var bulletBuilder = (Color textColor, MarkdownListType type, String preffix) {
    if (type == MarkdownListType.unordered) {
      return Container(
        margin: EdgeInsets.only(right: 5),
        child: Icon(
          Icons.circle,
          color: textColor,
          size: 6,
        ),
      );
    }
    return Text(
      '$preffix. ',
      style: TextStyle(
        color: textColor,
      ),
    );
  };

  var codeStyle = VitCodeBlockStyle.dark();
  late var listStyle = VitListBlockStyle.dark(
    bulletBuilder: bulletBuilder,
    checkboxBuilder: checkboxBuilder,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: PointerDeviceKind.values.toSet(),
      ),
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _themeSwitcher(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      children: [
                        _codeBlock(),
                        _listBlock(),
                        VitTableBlock(
                          markdownTable: '''
| Name | Age | City |
|------|-----|------|
| John | 25  | NYC  |
| Jane | 30  | LA   |
| Bob  | 35  | SF   |
''',
                          style: VitTableBlockStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listBlock() {
    return SizedBox(
      width: 250,
      child: VitListBlock(
        markdownText: '''
• Level 1 item
• Level 2 item
• Level 3 item
• Another level 1 item
  1. Nested ordered item
  2. Another ordered item
    2.1. Nested item
• Mixed nested item
  - [ ] Nested task
  • Level 1 with task list
- [ ] Nested task 1
- [x] Completed nested task
    ''',
        style: listStyle,
      ),
    );
  }

  Row _themeSwitcher() {
    return Row(
      children: [
        Text('Dark theme'),
        SizedBox(width: 5),
        Switch.adaptive(
          value: isDarkTheme,
          onChanged: (value) {
            isDarkTheme = value;
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
            setState(() {});
          },
        ),
      ],
    );
  }

  VitCodeBlock _codeBlock() {
    return VitCodeBlock(
      text: '''
// This is a comment
void main() {
  print("Hello, World!");
  print('Another string');
  if (true) {
    print("Success");
  } else {
    print("Failure"); // TODO Handle better
  }
  while (false) {
    print("This will never be printed");
  }
}

class Person {
  String name;
}
          ''',
      language: 'dart',
      style: codeStyle,
    );
  }
}
