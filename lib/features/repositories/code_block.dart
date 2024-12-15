// Model class to hold code block data
import 'package:flutter/widgets.dart';

import '../usecases/is_markdown_code_block.dart';

class CodeBlock {
  final String language;
  final String code;

  CodeBlock({
    required this.language,
    required this.code,
  });

  factory CodeBlock.empty() {
    return CodeBlock(
      language: '',
      code: '',
    );
  }

  factory CodeBlock.fromMarkdown(String text) {
    assert(text.isNotEmpty, 'Input text cannot be empty');

    // First check if it's a valid code block
    if (!isMarkdownCodeBlock(text)) {
      debugPrint("ERROR. String is not a code block: $text");
      return CodeBlock.empty();
    }

    // Remove the backticks and trim whitespace
    final content = text.substring(3, text.length - 3).trim();

    // If content is empty, return null
    if (content.isEmpty) {
      return CodeBlock.empty();
    }

    // Split the content into lines
    final indexOfNewLine = content.indexOf('\n');

    if (indexOfNewLine == -1) {
      return CodeBlock(
        language: '',
        code: content,
      );
    }

    var language = content.substring(0, indexOfNewLine);
    var code = content.substring(indexOfNewLine);

    return CodeBlock(
      language: language,
      code: code,
    );
  }

  @override
  String toString() => 'CodeBlock(language: $language, code: $code)';

  // Add equality operator for testing
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeBlock &&
        other.language == language &&
        other.code == code;
  }

  @override
  int get hashCode => language.hashCode ^ code.hashCode;
}
