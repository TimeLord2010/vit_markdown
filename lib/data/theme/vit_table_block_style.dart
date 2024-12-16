import 'package:flutter/material.dart';

class VitTableBlockStyle {
  final Border cellBorder;
  final Border headerBorder;
  final Color cellBackgroundColor;
  final Color headerBackgroundColor;
  final TextStyle cellTextStyle;
  final TextStyle headerTextStyle;
  final BorderRadius borderRadius;

  VitTableBlockStyle({
    Border? cellBorder,
    Border? headerBorder,
    Color? cellBackgroundColor,
    Color? headerBackgroundColor,
    TextStyle? cellTextStyle,
    TextStyle? headerTextStyle,
    BorderRadius? borderRadius,
  })  : cellBorder = cellBorder ??
            Border(
                // top: BorderSide(
                //   color: const Color.fromARGB(255, 0, 0, 0),
                // ),
                // bottom: BorderSide(
                //   color: const Color.fromARGB(255, 0, 0, 0),
                // ),
                ),
        headerBorder = headerBorder ??
            Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
        cellBackgroundColor = cellBackgroundColor ?? Colors.white,
        headerBackgroundColor =
            headerBackgroundColor ?? const Color.fromARGB(255, 232, 232, 232),
        cellTextStyle = cellTextStyle ??
            const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
        headerTextStyle = headerTextStyle ??
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
        borderRadius = borderRadius ??
            BorderRadius.all(
              Radius.circular(4),
            );

  // Copy with method for easy style modifications
  VitTableBlockStyle copyWith({
    Border? cellBorder,
    Border? headerBorder,
    Color? cellBackgroundColor,
    Color? headerBackgroundColor,
    TextStyle? cellTextStyle,
    TextStyle? headerTextStyle,
  }) {
    return VitTableBlockStyle(
      cellBorder: cellBorder ?? this.cellBorder,
      headerBorder: headerBorder ?? this.headerBorder,
      cellBackgroundColor: cellBackgroundColor ?? this.cellBackgroundColor,
      headerBackgroundColor:
          headerBackgroundColor ?? this.headerBackgroundColor,
      cellTextStyle: cellTextStyle ?? this.cellTextStyle,
      headerTextStyle: headerTextStyle ?? this.headerTextStyle,
    );
  }
}
