import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    colorScheme: const ColorScheme(
      primary: dutyBlue,
      secondary: dutyWhite,
      background: dutyWhite,
      surface: dutyWhite,
      onPrimary: dutyWhite,
      onSecondary: dutyBlue,
      onBackground: dutyBlue,
      onSurface: dutyBlue,
      brightness: Brightness.light,
      error: dutyRed,
      onError: dutyRed,
    ),

    // TEXT
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontSize: 23, color: dutyBlack),
      headlineMedium: TextStyle(fontSize: 32, color: dutyBlack),
      displayMedium: TextStyle(
          fontSize: 25, fontWeight: FontWeight.normal, color: dutyBlack),
      bodyMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.normal, color: dutyBlack),
      bodySmall: TextStyle(fontSize: 15, color: dutyBlack),
    ),
    // NAVBAR
    navigationBarTheme: const NavigationBarThemeData(backgroundColor: dutyRed),

    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: dutyRed),
    // SEGMENTED BTN
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(color: dutyWhite),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(dutyBlue),
      ),
    ),

    // ELEVATED BTN
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(color: dutyWhite),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(dutyBlue),
      ),
    ),

    // SCAFFOLD
    scaffoldBackgroundColor: dutyWhite,
    navigationDrawerTheme: const NavigationDrawerThemeData(
      backgroundColor: dutyWhite,
    ),
  );
}
