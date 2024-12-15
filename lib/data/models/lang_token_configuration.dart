class LangTokenConfiguration {
  final List<String> keywords;
  final List<String> controlFlow;
  final Pattern? _tokenSplitter;

  final RegExp stringPattern, commentPattern, separatorPattern;

  const LangTokenConfiguration({
    required this.stringPattern,
    required this.commentPattern,
    required this.separatorPattern,
    required this.keywords,
    required this.controlFlow,
    Pattern? tokenSplitter,
  }) : _tokenSplitter = tokenSplitter;

  Pattern get tokenSplitter {
    return _tokenSplitter ??
        RegExp(r'(\s+|[a-zA-Z_][a-zA-Z_0-9]*|\(|\)|\{|\}|\;|\.)');
  }
}
