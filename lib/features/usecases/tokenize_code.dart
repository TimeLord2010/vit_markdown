import 'package:vit_markdown/data/factories/create_code_token_configuration.dart';

import '../../data/enums/code_token_type.dart';
import '../../data/models/code_token.dart';
import '../../data/models/lang_token_configuration.dart';

List<CodeToken> tokenizeCode({
  required String text,
  String? language,
  LangTokenConfiguration? config,
}) {
  if (config == null) {
    assert(language != null);
    config ??= createLangTokenConfiguration(language!);
  }
  List<String> keywords = config.keywords;
  List<String> controlFlow = config.controlFlow;

  var tokens = <CodeToken>[];
  final matches = config.tokenSplitter.allMatches(text);

  for (var i = 0; i < matches.length; i++) {
    var segment = matches.elementAt(i).group(0)!;

    if (segment.trim().isEmpty) {
      tokens.add(CodeToken(
        segment,
        CodeTokenType.other,
      ));
    } else if (keywords.contains(segment)) {
      tokens.add(CodeToken(segment, CodeTokenType.keyword));
    } else if (controlFlow.contains(segment)) {
      tokens.add(CodeToken(segment, CodeTokenType.controlFlow));
    } else if (RegExp(r'^[_a-zA-Z][_a-zA-Z0-9]*$').hasMatch(segment)) {
      // Check if next token is a '(' to classify as function
      if (i + 1 < matches.length && matches.elementAt(i + 1).group(0) == '(') {
        tokens.add(CodeToken(segment, CodeTokenType.function));
      } else {
        if (segment[0].toUpperCase() == segment[0]) {
          tokens.add(CodeToken(segment, CodeTokenType.classIdentifier));
        } else {
          tokens.add(CodeToken(segment, CodeTokenType.variable));
        }
      }
    } else {
      tokens.add(CodeToken(segment, CodeTokenType.other));
    }
  }

  return tokens;
}
