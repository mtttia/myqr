import 'package:flutter/material.dart';
import 'package:myqr/utils/fileAssistant.dart';
import 'dart:convert';

FileAssistant fs = FileAssistant('setting_myqr.json');

class Chronology with ChangeNotifier {
  List<String> _chronology = [];
  bool _isLoading = true;

  List<String> get chronology => _chronology;
  bool get isLoading => _isLoading;

  Chronology() {
    fs.load().then((value) {
      _chronology = jsonDecode(value);
      _isLoading = false;
      notifyListeners();
    }).catchError((error, stackTrace) {
      _isLoading = false;
      notifyListeners();
    });
  }
}
