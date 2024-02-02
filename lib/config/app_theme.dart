import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: dutyBlue, primary: dutyBlue, secondary: dutyWhite),

    // TEXT
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontSize: 23),
      headlineMedium: TextStyle(fontSize: 32),
      displayMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      bodySmall: TextStyle(fontSize: 15),
    ),
    // NAVBAR
    navigationBarTheme:
        const NavigationBarThemeData(backgroundColor: dutyWhite),

    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: dutyWhite),
    // SEGMENTED BTN
    segmentedButtonTheme: const SegmentedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll<TextStyle>(
          TextStyle(backgroundColor: dutyBlue),
        ),
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
  );
}
