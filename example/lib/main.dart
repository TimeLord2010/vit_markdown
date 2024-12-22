import 'dart:ui';

import 'package:example/components/theme_switcher.dart';
import 'package:example/pages/blocks_page.dart';
import 'package:example/theme/full_markdown.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    var tabs = [
      Tab(text: 'Full Markdown example'),
      Tab(text: 'Blocks example'),
    ];
    return MaterialApp(
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: PointerDeviceKind.values.toSet(),
      ),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 0,
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Vit Markdown'),
            actions: [
              ThemeSwitcher(
                isDarkTheme: isDarkTheme,
                onSwitch: (value) {
                  setState(() {
                    isDarkTheme = value;
                  });
                },
              ),
            ],
            bottom: TabBar(tabs: tabs),
          ),
          body: SafeArea(
            child: TabBarView(
              children: [
                FullMarkdown(),
                BlocksPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
