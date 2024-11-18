import 'package:vit_markdown/data/factories/create_tokenize_options.dart';

import '../data/models/token.dart';
import 'tokenize.dart';

List<Token> tokenizeByLang(String text, String language) {
  var options = createTokenizeOptions(language);
  return tokenize(text, options);
}
