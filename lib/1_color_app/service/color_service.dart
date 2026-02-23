import 'package:flutter/material.dart';

enum CardType { red, blue }

class ColorService extends ChangeNotifier {
  final Map<CardType, int> _counts = {CardType.red: 0, CardType.blue: 0};

  int getCount(CardType type) {
    return _counts[type]!;
  }

  void tap(CardType type) {
    _counts[type] = _counts[type]! + 1;
    notifyListeners();
  }
}

final colorService = ColorService();
