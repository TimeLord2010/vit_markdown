bool isMarkdownCodeBlock(String text) {
  // Assert that input is not empty
  assert(text.isNotEmpty, 'Input text cannot be empty');

  // Trim whitespace
  final trimmed = text.trim();

  // Assert minimum length requirement
  assert(trimmed.length >= 6 || !trimmed.startsWith('```'),
      'Code block must be at least 6 characters long if it starts with ```');

  return trimmed.startsWith('```') &&
      trimmed.endsWith('```') &&
      trimmed.length >= 6;
}
