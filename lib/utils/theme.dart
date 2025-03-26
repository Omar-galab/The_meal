import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.orange,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black87),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.orange,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white70),
  ),
);
