import 'package:flutter/material.dart';
import 'package:vit_dart_extensions/vit_dart_extensions.dart';
import 'package:vit_markdown/components/atoms/vit_list_block_theme.dart';

import '../../data/enums/markdown_list_type.dart';
import '../../data/theme/vit_list_block_style.dart';

class VitListBlock extends StatefulWidget {
  final String markdownText;
  final VitListBlockStyle? style;

  const VitListBlock({
    super.key,
    required this.markdownText,
    this.style,
  });

  @override
  State<VitListBlock> createState() => _VitListBlockState();
}

class _VitListBlockState extends State<VitListBlock> {
  VitListBlockStyle get style {
    if (widget.style != null) return widget.style!;
    var style = VitListBlockTheme.of(context);
    return style;
  }

  @override
  Widget build(BuildContext context) {
    var style = this.style;
    var lines = widget.markdownText.split('\n');
    return Container(
      padding: style.padding,
      margin: style.margin,
      color: style.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var line in lines) _parseLine(line),
        ].separatedBy(SizedBox(height: style.verticalSpacing)),
      ),
    );
  }

  Widget _parseLine(String line) {
    var style = this.style;
    var spacePattern = RegExp(r'^\s+\S');
    var indent = spacePattern.stringMatch(line) ?? '';
    indent = RegExp(r'\s+').stringMatch(indent) ?? '';
    var indentCount = indent.length;

    List<Widget> getPreffix() {
      List<Widget> prefixWidgets = [];

      // Handle bullet points
      var textColor = style.textStyle?.color ?? Color.fromARGB(255, 0, 0, 0);
      var bulletBuilder = style.bulletBuilder;
      if (bulletBuilder != null) {
        // Handle ordered lists (including decimal notation like 1.2.3)
        final orderedPattern = RegExp(r'^\s*(\d+(?:\.\d+)*)[.)] ');
        final orderedMatch = orderedPattern.firstMatch(line);
        if (orderedMatch != null) {
          // Extract the full number string (including decimal notation)
          final numberStr = orderedMatch.group(1)!;

          // Remove the number and separator from the line
          line = line.replaceFirst(orderedPattern, '').trim();
          prefixWidgets.add(
              bulletBuilder(textColor, MarkdownListType.ordered, numberStr));
        } else {
          // Handle unordered lists
          final bulletPattern = RegExp(r'^\s*[-*•]\s');
          if (bulletPattern.hasMatch(line)) {
            // Remove the bullet point from the line
            line = line.replaceFirst(bulletPattern, '').trim();
            prefixWidgets
                .add(bulletBuilder(textColor, MarkdownListType.unordered, ''));
          }
        }
      }

      // Handle checkboxes - can appear with or without bullets
      var checkboxBuilder = style.checkboxBuilder;
      if (checkboxBuilder != null) {
        final checkboxPattern = RegExp(r'\[([ xX])\]');
        final match = checkboxPattern.firstMatch(line);
        if (match != null) {
          // Get the checkbox state
          final checkState = match.group(1);
          final isChecked = checkState?.toLowerCase() == 'x';

          // Remove the checkbox from the line
          line = line.replaceFirst(checkboxPattern, '').trim();
          prefixWidgets.add(checkboxBuilder(isChecked));
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
        for (var i = 0; i < indentCount; i++) SizedBox(width: style.indentSize),
        ...preffix,
        Text(line, style: style.textStyle),
      ],
    );
  }
}
