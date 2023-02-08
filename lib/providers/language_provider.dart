// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:pos/configs/app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale defaultLanguage = AppConfig.defaultLocale;

  LanguageProvider() {
    initialState();
  }

  void initialState() {
    syncDataWithProvider();
  }

  void changeLanguage(int languageCode) {
    defaultLanguage = AppConfig.localesSupport[languageCode];
    updateToSharedPreferences(languageCode);
    notifyListeners();
  }

  Locale get currentLanguage {
    return defaultLanguage;
  }

  Future updateToSharedPreferences(int languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('languageCode', languageCode);
  }

  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int index = prefs.getInt('languageCode') ?? 0;
    defaultLanguage = AppConfig.localesSupport[index];
  }
}
