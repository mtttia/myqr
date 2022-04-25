import 'package:flutter/material.dart';
import 'package:myqr/utils/fileAssistant.dart';
import 'dart:convert';

FileAssistant fs = FileAssistant('setting_myqr.json');

class Chronology with ChangeNotifier {
  List<String> _chronology = [];
  bool _isLoading = true;

  List<String> get chronology => _chronology;
  bool get isLoading => _isLoading;
  String get last => _chronology[_chronology.length - 1];
  bool get isEmpty => _chronology.isEmpty;

  Chronology() {
    _loader();
  }

  _loader() async {
    try {
      String value = await fs.load();
      _chronology = (jsonDecode(value) as List<dynamic>)
          .map((e) => e.toString())
          .toList();
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
    } finally {
      notifyListeners();
    }
  }

  push(String s) async {
    _chronology.remove(s);
    _chronology.add(s);
    notifyListeners();
    await fs.setData(jsonEncode(_chronology));
    await fs.save();
  }

  remove(String s) async {
    _chronology.remove(s);
    notifyListeners();
    await fs.setData(jsonEncode(_chronology));
  }
}
