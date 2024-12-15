import 'package:flutter/material.dart';
import 'package:vit_dart_extensions/vit_dart_extensions.dart';

// Enum to represent different types of lists
enum MarkdownListType {
  unordered,
  ordered,
  task,
}

// Model class for list items
class MarkdownListItem {
  final String content;
  final int level;
  final MarkdownListType type;
  final bool? isChecked; // For task lists
  final List<MarkdownListItem> children = [];
  final List<InlineSpan> formattedContent = []; // For styled text within items

  MarkdownListItem({
    required this.content,
    required this.level,
    required this.type,
    this.isChecked,
  });
}

class VitListBlock extends StatelessWidget {
  final String markdownText;
  final TextStyle? textStyle;
  final double indentSize;
  final double verticalSpacing;
  final Widget Function(MarkdownListType type, int level)? bulletBuilder;
  final Widget Function(bool? isChecked)? checkboxBuilder;

  const VitListBlock({
    super.key,
    required this.markdownText,
    this.textStyle,
    this.indentSize = 8,
    this.verticalSpacing = 4,
    this.bulletBuilder,
    this.checkboxBuilder,
  });

  @override
  Widget build(BuildContext context) {
    var lines = markdownText.split('\n');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var line in lines) _parseLine(line),
      ].separatedBy(SizedBox(height: verticalSpacing)),
    );
  }

  Widget _parseLine(String line) {
    var spacePattern = RegExp(r'^\s+\S');
    var ident = spacePattern.stringMatch(line) ?? '';
    ident = RegExp(r'\s+').stringMatch(ident) ?? '';
    var identCount = ident.length;

    List<Widget> getPreffix() {
      List<Widget> prefixWidgets = [];

      // Handle bullet points
      if (bulletBuilder != null) {
        // Handle ordered lists (numbers followed by dot or parenthesis)
        final orderedPattern = RegExp(r'^\s*\d+[.)] ');
        if (orderedPattern.hasMatch(line)) {
          // Remove the number and separator from the line
          line = line.replaceFirst(orderedPattern, '').trim();
          prefixWidgets
              .add(bulletBuilder!(MarkdownListType.ordered, identCount));
        } else {
          // Handle unordered lists
          final bulletPattern = RegExp(r'^\s*[-*•]\s');
          if (bulletPattern.hasMatch(line)) {
            // Remove the bullet point from the line
            line = line.replaceFirst(bulletPattern, '').trim();
            prefixWidgets
                .add(bulletBuilder!(MarkdownListType.unordered, identCount));
          }
        }
      }

      // Handle checkboxes - can appear with or without bullets
      if (checkboxBuilder != null) {
        final checkboxPattern = RegExp(r'\[([ xX])\]');
        final match = checkboxPattern.firstMatch(line);
        if (match != null) {
          // Get the checkbox state
          final checkState = match.group(1);
          final isChecked = checkState?.toLowerCase() == 'x';

          // Remove the checkbox from the line
          line = line.replaceFirst(checkboxPattern, '').trim();
          prefixWidgets.add(checkboxBuilder!(isChecked));
        }
      }

      // Add spacing between bullet and checkbox if both exist
      if (prefixWidgets.length > 1) {
        prefixWidgets.insert(
            1, SizedBox(width: 4)); // Add small gap between bullet and checkbox
      }

      return prefixWidgets;
    }

    var preffix = getPreffix();

    return Row(
      children: [
        for (var i = 0; i < identCount; i++) SizedBox(width: indentSize),
        ...preffix,
        Text(line, style: textStyle),
      ],
    );
  }
}
