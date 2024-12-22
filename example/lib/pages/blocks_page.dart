import 'package:flutter/material.dart';
import 'package:vit_markdown/components/atoms/vit_code_block.dart';
import 'package:vit_markdown/components/atoms/vit_list_block.dart';
import 'package:vit_markdown/components/atoms/vit_table_block.dart';
import 'package:vit_markdown/data/theme/vit_table_block_style.dart';

import '../theme/theme.dart';

class BlocksPage extends StatelessWidget {
  const BlocksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          _codeBlock(),
          _listBlock(),
          _tableBlock(),
        ],
      ),
    );
  }

  Widget _tableBlock() {
    return VitTableBlock(
      markdownTable: '''
| Name | Age | City | Country |
|------|-----|------| ------ |
| John | 25  | NYC  | USA
| Jane | 30  | LA   | USA
| Bob  | 35  | SF   | USA
| Vini | 27  | FOR | BR
      ''',
      style: VitTableBlockStyle(
        headerBorder: Border.all(
          color: Colors.red,
          width: 1,
        ),
      ),
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
}
