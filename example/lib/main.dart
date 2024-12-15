import 'package:flutter/material.dart';
import 'package:vit_markdown/components/atoms/vit_code_block.dart';
import 'package:vit_markdown/components/atoms/vit_list_block.dart';
import 'package:vit_markdown/data/theme/vit_code_block_style.dart';

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
  VitCodeBlockStyle style = VitCodeBlockStyle.dark();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                        SizedBox(
                          width: 250,
                          height: 300,
                          child: _listBlock(),
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

  VitListBlock _listBlock() {
    return VitListBlock(
      markdownText: '''
• Level 1 item
• Level 2 item
• Level 3 item
• Another level 1 item
  1. Nested ordered item
  2. Another ordered item
• Mixed nested item
  - [ ] Nested task
  • Level 1 with task list
    - [ ] Nested task 1
    - [x] Completed nested task
''',
      checkboxBuilder: (isChecked) {
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
      },
      bulletBuilder: (type, level) {
        return Container(
          margin: EdgeInsets.only(right: 5),
          child: Icon(
            Icons.circle,
            size: 8,
          ),
        );
      },
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
              style = VitCodeBlockStyle.dark();
            } else {
              style = VitCodeBlockStyle();
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
      style: style,
    );
  }
}
