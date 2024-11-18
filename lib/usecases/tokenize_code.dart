import '../data/models/code_token.dart';

List<CodeToken> tokenizeCode(String text, String language) {
  // This function should be similar to `tokenizeByLang` but focused on
  // producing more detailed tokens for code constructs.

  List<String> keywords;
  List<String> controlFlow;

  // Define language-specific constructs
  switch (language.toLowerCase()) {
    case 'dart':
      keywords = ['class', 'enum', 'const', 'true', 'false'];
      controlFlow = ['if', 'else', 'for', 'break'];
      break;
    // Add other languages and their specific keywords/control flow here
    default:
      keywords = [];
      controlFlow = [];
  }

  // This should produce tokens distinguishing keywords, variables, etc.
  var tokens = <CodeToken>[];

  // Split by whitespace to start (not perfect for real parsing, but a start)
  final words = text.split(RegExp(r'\s+'));

  for (var word in words) {
    if (keywords.contains(word)) {
      tokens.add(CodeToken(word, 'keyword'));
    } else if (controlFlow.contains(word)) {
      tokens.add(CodeToken(word, 'control-flow'));
    } else if (RegExp(r'^[_a-zA-Z][_a-zA-Z0-9]*$').hasMatch(word)) {
      // Identifies simple variable names or identifiers
      tokens.add(CodeToken(word, 'variable'));
    } else {
      tokens.add(CodeToken(word, 'code')); // Default type
    }
  }

  return tokens;
}
