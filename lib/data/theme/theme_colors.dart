import 'dart:ui';

class ThemeColors {
  static final light = ThemeColorScheme(
    backgroundColor: const Color.fromARGB(255, 253, 253, 253),
    textColor: Color.fromARGB(255, 0, 0, 0),
  );
  static final dark = ThemeColorScheme(
      backgroundColor: const Color.fromARGB(255, 29, 29, 29),
      textColor: const Color.fromARGB(255, 255, 255, 255));
}

class ThemeColorScheme {
  final Color backgroundColor;
  final Color textColor;

  const ThemeColorScheme({
    required this.backgroundColor,
    required this.textColor,
  });
}
