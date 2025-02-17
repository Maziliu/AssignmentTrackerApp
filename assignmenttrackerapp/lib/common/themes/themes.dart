import 'package:flutter/material.dart';

final ThemeData assignmentTrackerTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFF1E1E2F),
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
  textTheme: TextTheme(
    headlineLarge: TextStyle(color: Color(0xFF00CFFD)),
    headlineSmall: TextStyle(color: Color(0xFFBB86FC)),
    bodyLarge: TextStyle(color: Colors.white),
    bodySmall: TextStyle(color: Color(0xFFA0A0B0)),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1E1E2F),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF00CFFD),
      foregroundColor: Color(0xFF1E1E2F),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFF2A2A3C),
    labelStyle: TextStyle(color: Color(0xFF00CFFD)),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFBB86FC)),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF00CFFD), width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  scaffoldBackgroundColor: Color(0xFF121212),
  cardTheme: CardTheme(
    color: Color(0xFF333340),
    elevation: 6,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    shadowColor: Colors.black.withOpacity(0.3),
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    surfaceTintColor: Colors.transparent,
  ),
  hoverColor: Color(0xFF2A2A3C),
);
