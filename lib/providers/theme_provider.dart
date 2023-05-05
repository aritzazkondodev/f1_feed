import 'package:flutter/material.dart';

import 'package:f1_feed/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool isDarkMode})
      : currentTheme = isDarkMode ? AppTheme.darkTheme : AppTheme.ligthTheme;

  setLightMode() {
    currentTheme = AppTheme.ligthTheme;
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = AppTheme.darkTheme;
    notifyListeners();
  }
}
