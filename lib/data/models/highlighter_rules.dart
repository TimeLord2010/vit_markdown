import 'package:flutter/widgets.dart';

class HighlighterRules {
  List<HighlightRule> rules;

  HighlighterRules({
    required this.rules,
  });
}

class HighlightRule {
  final RegExp pattern;
  final TextStyle style;
  final int priority;

  HighlightRule({
    required this.pattern,
    required this.style,
    required this.priority,
  });
}
