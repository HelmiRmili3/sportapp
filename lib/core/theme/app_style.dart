import 'package:flutter/material.dart';

// This class with provide an overall project text style

class AppStyle {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    splashColor: const Color(0xff98D52F),
    cardColor: const Color(0xff000000),
    scaffoldBackgroundColor: Colors.white,
    shadowColor: Colors.black,
    highlightColor: Colors.white,
    dialogBackgroundColor: const Color(0xffD9D9D9),
    indicatorColor: Colors.black,
    dividerColor: Colors.white,
    hintColor: Colors.white,
    buttonTheme: ButtonThemeData(splashColor: Colors.white.withOpacity(.5)),
    textTheme: const TextTheme(bodySmall: TextStyle(color: Colors.black)),
    dropdownMenuTheme: const DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(fillColor: Colors.white)),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xffE1E1E1),
      elevation: 0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xff161A26),
    splashColor: const Color(0xff98D52F),
    cardColor: const Color(0xffF2F2F2),
    scaffoldBackgroundColor: Colors.black,
    shadowColor: Colors.white,
    buttonTheme: ButtonThemeData(splashColor: Colors.black.withOpacity(.5)),
    canvasColor: Colors.white,
    dropdownMenuTheme: const DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(fillColor: Colors.black)),
    dialogBackgroundColor: const Color(0x54888888),
    hintColor: Colors.black.withOpacity(.6),
    indicatorColor: Colors.white,
    dividerColor: Colors.white,
    textTheme: const TextTheme(bodySmall: TextStyle(color: Colors.white)),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
    ),
  );
}
