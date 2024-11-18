import 'package:vit_markdown/data/models/tokenize_options.dart';

TokenizeOptions createTokenizeOptions(String lang) {
  switch (lang) {
    case "dart":
      return TokenizeOptions(
        stringPattern: RegExp(r'''("([^"\\]|\\.)*"|'([^'\\]|\\.)*')'''),
        commentPattern: RegExp(r'//.*?$', multiLine: true),
        separatorPattern: RegExp(r'[;\n]'),
      );
    case "bash":
      return TokenizeOptions(
        stringPattern: RegExp(r'''("[^"]*"|'[^']*')'''),
        commentPattern: RegExp(r'#.*?$'),
        separatorPattern: RegExp(r'[;\n|&]'),
      );
    case 'javascript':
    case 'js':
      return TokenizeOptions(
        stringPattern: RegExp(r'''("[^"]*"|'[^']*'|`[^`]*`)'''),
        commentPattern: RegExp(r' //.*?$|/\*[\s\S]*?\*/'),
        separatorPattern: RegExp(r'[;\n]'),
      );
    default:
      throw Exception('Not implemented');
  }
}
