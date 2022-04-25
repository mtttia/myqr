import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _light;

  ThemeProvider({bool light = true}) : _light = light;

  bool get light => _light;
  set light(bool value) {
    _light = value;
    notifyListeners();
  }

  toggleTheme() {
    _light = !_light;
    notifyListeners();
  }
}
