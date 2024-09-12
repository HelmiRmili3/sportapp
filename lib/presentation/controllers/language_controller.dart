import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  final Rx<Locale> _locale = const Locale('fr', 'FR').obs;

  Locale get locale => _locale.value;

  @override
  void onInit() {
    super.onInit();
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language_code') ?? 'fr';
    final countryCode = prefs.getString('country_code') ?? 'FR';
    _locale.value = Locale(languageCode, countryCode);
  }

  Future<void> changeLanguage(String languageCode, String countryCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', languageCode);
    await prefs.setString('country_code', countryCode);
    _locale.value = Locale(languageCode, countryCode);
    Get.updateLocale(_locale.value);
  }
}
