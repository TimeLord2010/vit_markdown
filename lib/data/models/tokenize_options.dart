class TokenizeOptions {
  final RegExp stringPattern, commentPattern, separatorPattern;

  TokenizeOptions({
    required this.stringPattern,
    required this.commentPattern,
    required this.separatorPattern,
  });
}
