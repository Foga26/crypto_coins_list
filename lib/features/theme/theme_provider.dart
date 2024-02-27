import 'package:flutter/material.dart';

class ThemeTest extends ChangeNotifier {
  bool isLightTheme = true;

  void darkTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }
}
