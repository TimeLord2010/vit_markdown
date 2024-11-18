import 'package:flutter/material.dart';
import 'package:vit_markdown/data/enums/token_type.dart';

import '../../usecases/tokeniza_by_lang.dart';

class VitCodeBlock extends StatelessWidget {
  const VitCodeBlock({
    super.key,
    required this.text,
    required this.language,
  });

  final String text;

  /// The language of the text such as javascript, bash or dart.
  final String language;

  @override
  Widget build(BuildContext context) {
    final tokens = tokenizeByLang(text, language);

    List<TextSpan> textSpans = tokens.map((token) {
      TextStyle style;

      switch (token.type) {
        case TokenType.comment:
          style =
              const TextStyle(color: Colors.green, fontStyle: FontStyle.italic);
          break;
        case TokenType.string:
          style = const TextStyle(color: Colors.red);
          break;
        case TokenType.separator:
          style = const TextStyle(color: Colors.grey);
          break;
        case TokenType.code:
        default:
          style = const TextStyle(color: Colors.black);
      }

      return TextSpan(text: token.text, style: style);
    }).toList();

    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.black12,
      child: RichText(
        text: TextSpan(
          children: textSpans,
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
