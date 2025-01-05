import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportapp/core/theme/app_style.dart';
import '../../core/app_constants.dart';

class ThemeController extends GetxController {
  final darkTheme = AppStyle.darkTheme;
  final lightTheme = AppStyle.lightTheme;
  final SharedPreferences prefs;

  final Rx<ThemeData> _themeData = Rx<ThemeData>(AppStyle.lightTheme);
  ThemeData get themeData => _themeData.value;

  final RxBool _isDarkTheme = false.obs;
  bool get isDarkTheme => _isDarkTheme.value;
  ThemeController({
    required this.prefs,
  });

  @override
  void onInit() {
    super.onInit();
    initializeTheme();
  }

  Future<void> initializeTheme() async {
    bool themeBoolValue = await getStoredThemeValue();
    _isDarkTheme.value = themeBoolValue;
    _themeData.value = _isDarkTheme.value ? darkTheme : lightTheme;
  }

  Future<bool> getStoredThemeValue() async {
    bool? themeBoolValue = prefs.getBool("themeValue");
    if (themeBoolValue == null) {
      themeBoolValue = false; // Default to dark theme
      await prefs.setBool("themeValue", themeBoolValue);
    }
    AppConstant.themValue = themeBoolValue;
    return themeBoolValue;
  }

  void setTheme({required bool themeValue}) async {
    _isDarkTheme.value = themeValue;
    AppConstant.themValue = themeValue;
    _themeData.value = themeValue ? darkTheme : lightTheme;
    await saveData('themeValue', themeValue);
    update();
  }

  Future<void> saveData(String key, dynamic value) async {
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    }
    update();
  }
}
