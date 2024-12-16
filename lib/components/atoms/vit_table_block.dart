import 'package:flutter/material.dart';

import '../../data/theme/vit_table_block_style.dart';

class VitTableBlock extends StatelessWidget {
  final String markdownTable;
  final VitTableBlockStyle style;

  VitTableBlock({
    super.key,
    required this.markdownTable,
    VitTableBlockStyle? style,
  }) : style = VitTableBlockStyle();

  @override
  Widget build(BuildContext context) {
    final List<List<String>> tableData = _parseMarkdownTable(markdownTable);
    if (tableData.isEmpty) return const SizedBox.shrink();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: style.headerBorder.top.color,
            width: style.cellBorder.top.width,
          ),
          borderRadius: style.borderRadius, // Add this line
        ),
        child: ClipRRect(
          // Add this wrapper
          borderRadius: style.borderRadius,
          child: Table(
            defaultColumnWidth: const IntrinsicColumnWidth(),
            children: _buildTableRows(tableData),
            border: TableBorder(
              horizontalInside: style.cellBorder.top,
              verticalInside: style.cellBorder.left,
            ),
          ),
        ),
      ),
    );
  }

  List<TableRow> _buildTableRows(List<List<String>> tableData) {
    final rows = <TableRow>[];

    for (var i = 0; i < tableData.length; i++) {
      final isHeader = i == 0;

      rows.add(
        TableRow(
          decoration: BoxDecoration(
            color: isHeader
                ? style.headerBackgroundColor
                : style.cellBackgroundColor,
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
