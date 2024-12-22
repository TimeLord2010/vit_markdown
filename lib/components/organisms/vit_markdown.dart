import 'package:flutter/widgets.dart';

class VitMarkdown extends StatelessWidget {
  const VitMarkdown({
    super.key,
    required this.markdown,
  });

  final String markdown;

  @override
  Widget build(BuildContext context) {
    return Text(markdown);
  }
}
