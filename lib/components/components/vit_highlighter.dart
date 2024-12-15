import 'package:flutter/material.dart';

import '../../data/models/highlighter_rules.dart';

class VitHighlighter extends StatelessWidget {
  const VitHighlighter({
    super.key,
    required this.rules,
    required this.text,
    this.isCompleted = true,
  });

  final HighlighterRules rules;
  final String text;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    if (!isCompleted) {
      return Text(
        text,
        style: const TextStyle(
          fontFamily: 'Menlo',
          fontSize: 11,
        ),
      );
    }

    List<TextSpan> spans = [];
    List<String> lines = text.split('\n');

    const textStyle = TextStyle(
      fontFamily: 'Menlo',
      fontSize: 11,
    );

    for (int i = 0; i < lines.length; i++) {
      var line = lines[i];
      void parseWords(String line, [bool appendSpace = true]) {
        List<String> words = line.split(' ');

        for (var word in words) {
          var matched = false;
          for (var entry in rules.rules) {
            var pattern = entry.pattern;
            var matches = pattern.allMatches(word);
            if (matches.isNotEmpty) {
              matched = true;
              var match = matches.elementAt(0);
              var before = word.substring(0, match.start);
              parseWords(before, false);
            }
            for (int i = 0; i < matches.length; i++) {
              var match = matches.elementAt(i);
              var value = match.group(0)!;
              spans.add(TextSpan(
                text: value,
                style: textStyle.merge(entry.style),
              ));
              var nextMatch =
                  i < matches.length - 1 ? matches.elementAt(i + 1) : null;

              var after = word.substring(match.end, nextMatch?.start);
              parseWords(after, false);
            }
            if (matches.isNotEmpty) {
              spans.add(const TextSpan(
                text: ' ',
                style: textStyle,
              ));
              continue;
            }
          }
          if (matched) {
            continue;
          }

          spans.add(TextSpan(
            text: appendSpace ? '$word ' : word,
            style: textStyle,
          ));
        }
      }

      if (line.contains('//')) {
        var pattern = RegExp(r'//(/)?');
        var commentSymbol = pattern.firstMatch(line)!;
        var [code, comment] = line.split(pattern);
        parseWords(code);
        spans.add(TextSpan(
          text: '${commentSymbol.group(0)}$comment',
          style: textStyle.merge(const TextStyle(
            color: Color.fromARGB(255, 98, 130, 76),
          )),
        ));
      } else {
        parseWords(line);
      }

      // Add a new line at the end of each processed line
      if (i < lines.length - 1) {
        spans.add(const TextSpan(text: '\n'));
      }
    }

    return SelectableText.rich(
      TextSpan(
        children: spans,
      ),
      style: const TextStyle(
        height: 1,
      ),
    );

    // return RichText(
    //   text: TextSpan(
    //     children: spans,
    //   ),
    // );
  }
}
