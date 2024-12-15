import 'package:flutter/material.dart';
import 'package:vit_markdown/components/atoms/vit_code_block_theme.dart';
import 'package:vit_markdown/data/enums/code_token_type.dart';
import 'package:vit_markdown/data/enums/token_type.dart';
import 'package:vit_markdown/data/theme/vit_code_block_style.dart';
import 'package:vit_markdown/features/repositories/code_block.dart';
import 'package:vit_markdown/features/usecases/tokenize_code.dart';

import '../../data/models/lang_token_configuration.dart';
import '../../features/usecases/tokenize_by_lang.dart';

class VitCodeBlock extends StatefulWidget {
  /// This widget is sensible to the platform brightness. To change that,
  /// provider a value to [style].
  const VitCodeBlock({
    super.key,
    required this.text,
    this.language,
    this.style,
    this.langConfig,
  });

  factory VitCodeBlock.fromMarkdown(String codeBlock) {
    var block = CodeBlock.fromMarkdown(codeBlock);

    return VitCodeBlock(
      text: block.code,
      language: block.language,
    );
  }

  final String text;

  /// The language of the text such as javascript, bash or dart.
  final String? language;

  final VitCodeBlockStyle? style;

  final LangTokenConfiguration? langConfig;

  @override
  State<VitCodeBlock> createState() => _VitCodeBlockState();
}

class _VitCodeBlockState extends State<VitCodeBlock> {
  VitCodeBlockStyle get style {
    if (widget.style != null) return widget.style!;
    var style = VitCodeBlockTheme.of(context);
    return style;
  }

  @override
  Widget build(BuildContext context) {
    final tokens = tokenizeByLang(
      widget.text,
      language: widget.language,
      config: widget.langConfig,
    );

    List<TextSpan> textSpans = tokens.map((token) {
      var style = this.style;
      if (token.type == TokenType.code) {
        var text = token.text;
        var codeTokens = tokenizeCode(
          text: text,
          language: widget.language,
          config: widget.langConfig,
        );
        var spans = <InlineSpan>[];
        for (var codeToken in codeTokens) {
          TextStyle getStyle() {
            switch (codeToken.type) {
              case CodeTokenType.keyword:
                return style.keywordStyle;
              case CodeTokenType.controlFlow:
                return style.controlFlowStyle;
              case CodeTokenType.variable:
                return style.variableStyle;
              case CodeTokenType.classIdentifier:
                return style.classIdentifierStyle;
              case CodeTokenType.function:
                return style.functionNameStyle;
              case CodeTokenType.other:
                return style.style;
            }
          }

          spans.add(TextSpan(
            text: codeToken.text,
            style: getStyle(),
          ));
        }
        return TextSpan(
          children: spans,
        );
      }

      TextStyle textStyle;
      switch (token.type) {
        case TokenType.comment:
          textStyle = style.commentStyle;
          break;
        case TokenType.string:
          textStyle = style.stringStyle;
          break;
        default:
          textStyle = style.style;
      }

      return TextSpan(
        text: token.text,
        style: textStyle,
      );
    }).toList();

    return Container(
      padding: style.padding,
      margin: style.margin,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: style.borderRadius,
      ),
      child: RichText(
        text: TextSpan(
          children: textSpans,
          style: style.rootTextStyle,
        ),
      ),
    );
  }
}
