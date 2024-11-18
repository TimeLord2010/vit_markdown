import 'package:vit_markdown/data/enums/code_token_type.dart';

class CodeToken {
  final String text;
  final CodeTokenType type;

  CodeToken({
    required this.text,
    required this.type,
  });
}
