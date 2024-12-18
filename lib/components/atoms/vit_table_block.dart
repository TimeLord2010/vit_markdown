import 'package:flutter/material.dart';

import '../../data/theme/vit_table_block_style.dart';

class VitTableBlock extends StatelessWidget {
  final String markdownTable;
  final VitTableBlockStyle style;

  VitTableBlock({
    super.key,
    required this.markdownTable,
    VitTableBlockStyle? style,
  }) : style = style ?? VitTableBlockStyle();

  @override
  Widget build(BuildContext context) {
    final List<List<String>> tableData = _parseMarkdownTable(markdownTable);
    if (tableData.isEmpty) return const SizedBox.shrink();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ClipRRect(
        borderRadius: style.borderRadius,
        child: Table(
          defaultColumnWidth: const IntrinsicColumnWidth(),
          children: _buildTableRows(tableData),
          border: TableBorder(
              // top: style.headerBorder.top,
              // horizontalInside: BorderSide(
              //   color: style.cellBorder.top.color,
              //   width: style.cellBorder.top.width,
              // ),
              // bottom: style.cellBorder.bottom,
              // left: style.cellBorder.left,
              // right: style.cellBorder.right,
              // verticalInside: style.cellBorder.left,
              ),
        ),
      ),
    );
  }

  List<TableRow> _buildTableRows(List<List<String>> tableData) {
    final rows = <TableRow>[];

    for (var i = 0; i < tableData.length; i++) {
      final isHeader = i == 0;
      var isFirstRow = i == 1;

      Color getBackgroundColor() {
        if (isHeader) {
          return style.headerBackgroundColor;
        }
        return style.cellBackgroundColor;
      }

      BoxBorder? getBorder() {
        if (isHeader) {
          return style.headerBorder;
        }
        if (!isFirstRow) {
          return style.cellBorder;
        }
        return null;
      }

      BorderRadiusGeometry? getBorderRadius() {
        if (isHeader) {
          return BorderRadius.only(
            topLeft: style.borderRadius.topLeft,
            topRight: style.borderRadius.topRight,
          );
        }
        return null;
      }

      rows.add(
        TableRow(
          decoration: BoxDecoration(
            color: getBackgroundColor(),
            border: getBorder(),
            borderRadius: getBorderRadius(),
          ),
          children: tableData[i].map((cell) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cell,
                style: isHeader ? style.headerTextStyle : style.cellTextStyle,
              ),
            );
          }).toList(),
        ),
      );
    }

    return rows;
  }

  List<List<String>> _parseMarkdownTable(String markdown) {
    final lines = markdown.trim().split('\n');
    if (lines.length < 3) return [];

    final List<List<String>> result = [];
    //bool headerFound = false;

    for (var line in lines) {
      line = line.trim();
      if (line.isEmpty) continue;

      if (RegExp(r'^[\|\s-]+$').hasMatch(line)) {
        //headerFound = true;
        continue;
      }

      final cells = line
          .split('|')
          .map((cell) => cell.trim())
          .where((cell) => cell.isNotEmpty)
          .toList();

      if (cells.isNotEmpty) {
        result.add(cells);
      }
    }

    return result;
  }
}
