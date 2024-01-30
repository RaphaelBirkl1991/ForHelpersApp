import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/app_theme.dart';
import 'package:p12_basic_widgets/features/infrastructure/custom_navbar.dart';
import 'package:p12_basic_widgets/features/set_alarm/alarm_screen.dart';
import 'package:p12_basic_widgets/features/set_smoke/smoke_screen.dart';
import 'package:p12_basic_widgets/features/show_map/map_screen.dart';
import 'package:p12_basic_widgets/features/show_settings/tabbar_screen.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MapScreen(),
    const SmokeSignalScreen(),
    const AlarmSignalScreen(),
    const TabBarScreen()
  ];

  @override
  Widget build(BuildContext context) {
    /*
   if(AuthenticationService.userIsAlreadyRegistered()) {
    return AuthenticationScreen(); 
    else return Scaffold....
   }

    */
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
