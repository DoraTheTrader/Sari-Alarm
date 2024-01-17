import 'package:flutter/material.dart';


ThemeData darkMode = ThemeData(

  colorScheme: ColorScheme.dark(
    brightness: Brightness.light,
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    inversePrimary: Colors.grey.shade500,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: Colors.grey[3000],
    displayColor: Colors.white,
  ),
);