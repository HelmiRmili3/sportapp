import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportapp/core/theme/app_style.dart';
import '../../core/app_constants.dart';

class ThemeController extends GetxController {
  final darkTheme = AppStyle.darkTheme;
  final lightTheme = AppStyle.lightTheme;

  final Rx<ThemeData?> _themeData = Rx<ThemeData>(AppStyle.lightTheme);
  ThemeData? get themeData => _themeData.value;

  RxBool _isDarkTheme = true.obs;
  bool get isDarkTheme => _isDarkTheme.value;

  @override
  void onInit() {
    super.onInit();
    initializeTheme();
  }

  Future<void> initializeTheme() async {
    bool? themeBoolValue = await getStoredThemeValue();
    _isDarkTheme.value = themeBoolValue ?? true;
    _themeData.value = _isDarkTheme.value ? darkTheme : lightTheme;
  }

  Future<bool?> getStoredThemeValue() async {
    final prefs = await SharedPreferences.getInstance();
    bool? themeBoolValue = prefs.getBool("themeValue");

    if (themeBoolValue == null) {
      themeBoolValue = true;
      await prefs.setBool("themeValue", true);
    }
    AppConstant.themValue = themeBoolValue;
    return themeBoolValue;
  }

  void setTheme({required bool themeValue}) async {
    _isDarkTheme.value = themeValue;
    AppConstant.themValue = themeValue;
    _themeData.value = themeValue ? darkTheme : lightTheme;
    update();
    saveData('themeMode', themeValue);
  }

  static Future<void> saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    }
  }
}
