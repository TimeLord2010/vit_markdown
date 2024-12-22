import 'package:flutter/material.dart';
import 'package:vit_markdown/data/enums/markdown_list_type.dart';
import 'package:vit_markdown/data/theme/vit_code_block_style.dart';
import 'package:vit_markdown/data/theme/vit_list_block_style.dart';

var checkboxBuilder = (isChecked) {
  return Container(
    width: 16,
    height: 16,
    margin: EdgeInsets.only(right: 5),
    child: Checkbox.adaptive(
      value: isChecked,
      onChanged: (v) {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    ),
  );
};
var bulletBuilder = (Color textColor, MarkdownListType type, String preffix) {
  if (type == MarkdownListType.unordered) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      child: Icon(
        Icons.circle,
        color: textColor,
        size: 6,
      ),
    );
  }
  return Text(
    '$preffix. ',
    style: TextStyle(
      color: textColor,
    ),
  );
};

var codeStyle = VitCodeBlockStyle.dark();
var listStyle = VitListBlockStyle.dark(
  bulletBuilder: bulletBuilder,
  checkboxBuilder: checkboxBuilder,
);
