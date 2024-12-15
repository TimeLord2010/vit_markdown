import 'package:vit_markdown/data/enums/token_type.dart';

class Token {
  final int start;
  final int end;
  final TokenType type;
  final String text;

  Token(this.start, this.end, this.type, this.text);
}
