import 'package:flutter/material.dart';

enum ThemeColor {
  blue(color: Color.fromARGB(255, 34, 118, 229)),
  green(color: Color.fromARGB(255, 229, 158, 221)),
  pink(color: Color.fromARGB(255, 156, 202, 8));

  const ThemeColor({required this.color});

  final Color color;
  Color get backgroundColor => color.withAlpha(100);
}

ThemeColor currentThemeColor = ThemeColor.blue;

class ThemeColorProvider extends ChangeNotifier {
  ThemeColor _currentColor = ThemeColor.blue;

  ThemeColor get current => _currentColor;
  Color get mainColor => _currentColor.color;
  Color get backgroundColor => _currentColor.backgroundColor;

  void setTheme(ThemeColor theme) {
    _currentColor = theme;
    notifyListeners();
  }
}


final themeColorProvider = ThemeColorProvider();
