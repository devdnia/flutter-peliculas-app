import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary  = Colors.indigo;
  static const Color iconGrey = Colors.grey;


  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Color primario
    primaryColor: primary,

    // AppBar Theme:
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
  );
}
