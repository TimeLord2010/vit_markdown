import 'package:flutter/material.dart';
import 'package:vit_markdown/components/components/vit_code_block.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: VitCodeBlock(
          text: '''
// This is a comment
void main() {
  print("Hello, World!");
  print('Another string');
  if (true) {
      print("Success");
  } else {
      print("Failure");
  }
}
          ''',
          language: 'dart',
        ),
      ),
    );
  }
}
