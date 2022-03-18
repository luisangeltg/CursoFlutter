import 'package:flutter/material.dart';

class AppTheme {
  static const Color colorNaranjaOvercast = Color(0xFFffa729);
  static const Color colorVerdeOvercast = Color(0xFF147064);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      //color primario
      primaryColor: colorVerdeOvercast,
      //appbar theme
      appBarTheme: const AppBarTheme(color: colorVerdeOvercast, elevation: 0),

      //TextButton Theme
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: colorNaranjaOvercast)),

      //floatingActionButtons
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: colorNaranjaOvercast,
      ));
}
