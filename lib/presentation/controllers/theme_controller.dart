import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportapp/core/theme/app_style.dart';
import '../../core/app_constants.dart';

class ThemeController extends GetxController {
  // Themes from AppStyle
  final darkTheme = AppStyle.darkTheme;
  final lightTheme = AppStyle.lightTheme;

  // Observable to hold the current theme data
  final Rx<ThemeData> _themeData = Rx<ThemeData>(AppStyle.lightTheme);
  ThemeData get themeData => _themeData.value;

  // Observable to hold the current theme state (dark or light)
  final RxBool _isDarkTheme = true.obs;
  bool get isDarkTheme => _isDarkTheme.value;

  @override
  void onInit() {
    super.onInit();
    initializeTheme();
  }

  // Initialize theme from SharedPreferences or default to true (dark theme)
  Future<void> initializeTheme() async {
    bool themeBoolValue = await getStoredThemeValue();
    _isDarkTheme.value = themeBoolValue;
    _themeData.value = _isDarkTheme.value ? darkTheme : lightTheme;
  }

  // Retrieve stored theme value from SharedPreferences
  Future<bool> getStoredThemeValue() async {
    final prefs = await SharedPreferences.getInstance();
    bool? themeBoolValue = prefs.getBool("themeValue");
    if (themeBoolValue == null) {
      themeBoolValue = true; // Default to dark theme
      await prefs.setBool("themeValue", themeBoolValue);
    }
    AppConstant.themValue = themeBoolValue;
    return themeBoolValue;
  }

  // Set theme based on the value provided and save it to SharedPreferences
  void setTheme({required bool themeValue}) async {
    _isDarkTheme.value = themeValue;
    AppConstant.themValue = themeValue;
    _themeData.value = themeValue ? darkTheme : lightTheme;
    await saveData('themeValue', themeValue);
    update(); // Notify listeners to update the UI
  }

  // Save data to SharedPreferences based on its type
  Future<void> saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    }
    update(); // Notify listeners to update the UI
  }
}
