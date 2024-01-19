import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/screens/tabbar_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
            headlineMedium: TextStyle(fontSize: 25),
            displayMedium:
                TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
            bodyMedium: TextStyle(fontSize: 13)),
        primaryColor: Color(int.parse("0xFF010536")),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF010536)),
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Scaffold(
        body: TabBarScreen(),
      ),
    );
  }
}
