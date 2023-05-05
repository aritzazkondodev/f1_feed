import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedNavigationOption = 2;

  int get selectedMenuOpt {
    return _selectedNavigationOption;
  }

  set selectedMenuOpt(int i) {
    _selectedNavigationOption = i;
    notifyListeners();
  }
}
