import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';

class AppTheme {
  static final ThemeData themeDataLightMode = ThemeData(
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
  static final ThemeData themeDataDarkMode = ThemeData(
    colorScheme: const ColorScheme(
      primary: dutyWhite,
      secondary: dutyBlue,
      background: dutyBlack, // Änderung von dutyWhite auf dutyBlack
      surface: dutyBlack, // Änderung von dutyWhite auf dutyBlack
      onPrimary: dutyBlack, // Änderung von dutyWhite auf dutyBlack
      onSecondary: dutyWhite, // Änderung von dutyBlue auf dutyWhite
      onBackground: dutyWhite, // Änderung von dutyBlue auf dutyWhite
      onSurface: dutyWhite, // Änderung von dutyBlue auf dutyWhite
      brightness: Brightness.dark, // Helligkeit auf dunkel setzen
      error: dutyRed,
      onError: dutyRed,
    ),

    // TEXT
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
          fontSize: 23,
          color: dutyWhite), // Änderung von dutyBlack auf dutyWhite
      headlineMedium: TextStyle(
          fontSize: 32,
          color: dutyWhite), // Änderung von dutyBlack auf dutyWhite
      displayMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.normal,
          color: dutyWhite), // Änderung von dutyBlack auf dutyWhite
      bodyMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: dutyWhite), // Änderung von dutyBlack auf dutyWhite
      bodySmall: TextStyle(
          fontSize: 15,
          color: dutyWhite), // Änderung von dutyBlack auf dutyWhite
    ),
    // NAVBAR
    navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: dutyBlue), // Änderung von dutyRed auf dutyBlue

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: dutyBlue), // Änderung von dutyRed auf dutyBlue
    // SEGMENTED BTN
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
              color: dutyBlack), // Änderung von dutyWhite auf dutyBlack
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            dutyWhite), // Änderung von dutyBlue auf dutyWhite
      ),
    ),

    // ELEVATED BTN
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
              color: dutyBlack), // Änderung von dutyWhite auf dutyBlack
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            dutyWhite), // Änderung von dutyBlue auf dutyWhite
      ),
    ),

    // SCAFFOLD
    scaffoldBackgroundColor: dutyBlack, // Änderung von dutyWhite auf dutyBlack
    navigationDrawerTheme: const NavigationDrawerThemeData(
      backgroundColor: dutyBlack, // Änderung von dutyWhite auf dutyBlack
    ),
  );
}
