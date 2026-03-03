import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {

  String _languageCode = "en";

  String get languageCode => _languageCode;

  void changeLanguage(String code) {

    _languageCode = code;

    notifyListeners();

  }

}