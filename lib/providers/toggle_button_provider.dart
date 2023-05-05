import 'package:flutter/material.dart';

class ToggleButtonProvider extends ChangeNotifier {
  List<Widget> options = [const Text('Pilotos'), const Text('Constructores')];

  final List<bool> _selectedHomeOption = [false, true];

  final List<bool> _selectedDetailOption = [false, true];

  List<bool> get selectedHomeOption {
    return _selectedHomeOption;
  }

  List<bool> get selectedDetailOption {
    return _selectedDetailOption;
  }

  set selectedHomeToggleOption(int index) {
    for (int i = 0; i < _selectedHomeOption.length; i++) {
      _selectedHomeOption[i] = i == index;
    }
    notifyListeners();
  }

  set selectedDetailToggleOption(int index) {
    for (int i = 0; i < _selectedDetailOption.length; i++) {
      _selectedDetailOption[i] = i == index;
    }
    notifyListeners();
  }
}
