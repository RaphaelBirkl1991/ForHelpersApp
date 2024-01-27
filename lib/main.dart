import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/presentation/alarm_screen.dart';
import 'package:p12_basic_widgets/presentation/map_screen.dart';
import 'package:p12_basic_widgets/presentation/smoke_screen.dart';
import 'package:p12_basic_widgets/presentation/tabbar_screen.dart';

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
          headlineMedium: TextStyle(fontSize: 32),
          displayMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
        primaryColor: Color(int.parse("0xFF010536")),
        hintColor: Colors.white,
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
      ),
      home: const MainAppScreen(),
    );
  }
}

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainAppScreen> {
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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined,
                  color: Theme.of(context).primaryColor),
              label: "map"),
          BottomNavigationBarItem(
              icon: Icon(Icons.warning_amber_outlined,
                  color: Theme.of(context).primaryColor),
              label: "smoke"),
          BottomNavigationBarItem(
              icon: Icon(Icons.alarm, color: Theme.of(context).primaryColor),
              label: "alarm"),
          BottomNavigationBarItem(
              icon:
                  Icon(Icons.more_vert, color: Theme.of(context).primaryColor),
              label: "settings"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
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
