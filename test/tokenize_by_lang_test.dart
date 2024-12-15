import 'package:flutter_test/flutter_test.dart';
import 'package:vit_dart_extensions/vit_dart_extensions.dart';
import 'package:vit_markdown/features/usecases/tokenize_by_lang.dart';

void main() {
  group('Tokenize a Bash script correctly', () {
    test('Minimal Bash script', () {
      const String bashScript = '''
# This is a comment
echo "Hello, World!"
''';
      var tokens = tokenizeByLang(bashScript, language: 'bash');

      expect(tokens.count((x) => x.type.isSeparator), greaterThan(0));
      expect(tokens.count((x) => x.type.isSeparator), lessThan(3));
      expect(tokens.count((t) => t.type.isString), equals(1));
      expect(tokens.count((t) => t.type.isComment), equals(1));

      expect(
        tokens.firstWhere((x) => x.type.isComment).text,
        "# This is a comment",
      );

      expect(
        tokens.firstWhere((x) => x.type.isString).text,
        '"Hello, World!"',
      );
    });

    test('Complex Bash script', () {
      const String bashScript = '''
# This is a comment
echo "Hello, World!"
echo 'Another string'
if [ \$? -eq 0 ]; then
  echo "Success"
else
  echo "Failure"
fi
''';
      var tokens = tokenizeByLang(bashScript, language: 'bash');

      expect(tokens, isNotEmpty);
      expect(tokens.count((t) => t.type.isString), equals(4));
      expect(tokens.count((t) => t.type.isComment), equals(1));
      expect(tokens.count((t) => t.type.isSeparator), greaterThan(4));
      expect(tokens.count((t) => t.type.isCode), greaterThan(6));

      // Adiciona verificações mais específicas para tokens, se necessário
      expect(tokens.firstWhere((x) => x.type.isComment).text.trim(),
          '# This is a comment');

      var strings = tokens.where((x) => x.type.isString).map((x) => x.text);

      expect(strings.toList(), [
        '"Hello, World!"',
        "'Another string'",
        '"Success"',
        '"Failure"',
      ]);
    });
  });

  group('Tokenize a Dart script correctly', () {
    test('Minimal Dart script', () {
      const String dartScript = '''
// This is a comment
print("Hello, World!");
''';
      var tokens = tokenizeByLang(dartScript, language: 'dart');

      expect(tokens.count((x) => x.type.isSeparator), greaterThan(0));
      expect(tokens.count((x) => x.type.isSeparator), greaterThan(1));
      expect(tokens.count((t) => t.type.isString), equals(1));
      expect(tokens.count((t) => t.type.isComment), equals(1));

      expect(
        tokens.firstWhere((x) => x.type.isComment).text.trim(),
        "// This is a comment",
      );

      expect(
        tokens.firstWhere((x) => x.type.isString).text,
        '"Hello, World!"',
      );
    });

    test('Complex Dart script', () {
      const String dartScript = '''
// This is a comment
void main() {
  print("Hello, World!");
  print('Another string');
  if (true) {
    print("Success");
  } else {
    print("Failure");
  }
}
''';
      var tokens = tokenizeByLang(dartScript, language: 'dart');

      expect(tokens, isNotEmpty);
      expect(tokens.count((t) => t.type.isString), equals(4));
      expect(tokens.count((t) => t.type.isComment), equals(1));
      expect(tokens.count((t) => t.type.isSeparator), greaterThan(5));
      expect(tokens.count((t) => t.type.isCode), greaterThan(6));

      // More specific token checks, if necessary
      expect(tokens.firstWhere((x) => x.type.isComment).text.trim(),
          '// This is a comment');

      var strings = tokens.where((x) => x.type.isString).map((x) => x.text);

      expect(strings.toList(), [
        '"Hello, World!"',
        "'Another string'",
        '"Success"',
        '"Failure"',
      ]);
    });
  });
}
