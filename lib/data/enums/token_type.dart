enum TokenType {
  code,
  comment,
  separator,
  string;

  bool get isString => this == string;

  bool get isSeparator => this == separator;

  bool get isComment => this == comment;

  bool get isCode => this == code;
}
