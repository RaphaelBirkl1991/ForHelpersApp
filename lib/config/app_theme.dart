import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 32),
      displayMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
    ),
    tabBarTheme: const TabBarTheme(
        indicatorColor: customGreen,
        labelColor: customGreen,
        //     indicatorColor: Color(int.parse("0xFF010536")),
        //   labelColor: Color(int.parse("0xFF010536")),
        indicator: BoxDecoration(
          color: customBlue,
        )),
    primaryColor: customBlue,
    hintColor: customWhite,
    segmentedButtonTheme: const SegmentedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll<TextStyle>(
          TextStyle(backgroundColor: customBlue),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(color: customWhite),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(customBlue),
      ),
    ),
    scaffoldBackgroundColor: customWhite,
  );
}
