import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/application/provider/custom_navbar.dart';
import 'package:p12_basic_widgets/config/app_theme.dart';
import 'package:p12_basic_widgets/presentation/main_screens/alarm_screen.dart';
import 'package:p12_basic_widgets/presentation/main_screens/map_screen.dart';
import 'package:p12_basic_widgets/presentation/main_screens/smoke_screen.dart';
import 'package:p12_basic_widgets/presentation/main_screens/tabbar_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      home: const MainAppScreen(),
    );
  }
}

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainAppScreen> {
  int _selectedIndex = 0;

  // Widgets für jede Seite, die durch die Bottom Navigation Bar angezeigt wird
  final List<Widget> _pages = [
    const MapScreen(),
    const SmokeSignalScreen(),
    const AlarmSignalScreen(),
    const TabBarScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomNavBar(
          selectedIndex: _selectedIndex, onItemTapped: onItemTapped),
    );
  }

  void onItemTapped(int index) {
    if (index == 4) {
      // Wenn das vierte Element (Index 3) ausgewählt ist, navigiere zum TabBarScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TabBarScreen()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}
