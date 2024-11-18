import 'package:vit_markdown/data/enums/token_type.dart';
import 'package:vit_markdown/data/models/tokenize_options.dart';

import '../data/models/token.dart';

List<Token> tokenize(String text, TokenizeOptions options) {
  var stringPattern = options.stringPattern;
  var commentPattern = options.commentPattern;
  var separatorPattern = options.separatorPattern;

  List<Token> tokens = [];

  int start = 0;

  // Pattern para capturar strings e comentários
  final pattern = RegExp(
    '${stringPattern.pattern}|${commentPattern.pattern}',
    multiLine: true,
  );

  for (final match in pattern.allMatches(text)) {
    if (match.start > start) {
      var segment = text.substring(start, match.start);
      var newTokens = _tokenizeSegment(
        segment,
        separatorPattern,
      );
      tokens.addAll(newTokens);
    }

    final type = match.group(0)!.startsWith(commentPattern)
        ? TokenType.comment
        : TokenType.string;
    tokens.add(Token(match.start, match.end, type, match.group(0)!));

    start = match.end;
  }

  // Tokenize a porção final se houver
  if (start < text.length) {
    tokens.addAll(_tokenizeSegment(text.substring(start), separatorPattern));
  }

  return tokens;
}

List<Token> _tokenizeSegment(String segment, RegExp separators) {
  List<Token> tokens = [];
  int start = 0;

  // Tokenize o restante por delimitadores
  if (start < segment.length) {
    tokens.addAll(_tokenizeBySeparators(segment.substring(start), separators));
  }

  return tokens;
}

List<Token> _tokenizeBySeparators(String segment, RegExp separators) {
  List<Token> tokens = [];
  int start = 0;

  // Use os separadores para dividir o segmento em tokens
  for (final match in separators.allMatches(segment)) {
    if (match.start > start) {
      // Adiciona o trecho de código anterior ao separador
      tokens.add(Token(start, match.start, TokenType.code,
          segment.substring(start, match.start)));
    }
    // Adiciona o separador como um token
    tokens.add(
        Token(match.start, match.end, TokenType.separator, match.group(0)!));
    start = match.end;
  }

  // Adiciona qualquer texto restante após o último separador
  if (start < segment.length) {
    tokens.add(
        Token(start, segment.length, TokenType.code, segment.substring(start)));
  }

  return tokens;
}
