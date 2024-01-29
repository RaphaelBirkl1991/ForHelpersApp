import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 32),
      displayMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
    ),
    tabBarTheme: TabBarTheme(
        indicatorColor: Colors.green,
        labelColor: Colors.green,
        //     indicatorColor: Color(int.parse("0xFF010536")),
        //   labelColor: Color(int.parse("0xFF010536")),
        indicator: BoxDecoration(
          color: Color(int.parse("0xFF010536")),
        )),
    primaryColor: Color(int.parse("0xFF010536")),
    hintColor: Colors.white,
    segmentedButtonTheme: const SegmentedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll<TextStyle>(
          TextStyle(backgroundColor: Color(0xFF010536)),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(color: Colors.white),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF010536)),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
