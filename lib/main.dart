import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/presentation/precautionary_screen.dart';
import 'package:p12_basic_widgets/presentation/registration_success.dart';
import 'package:p12_basic_widgets/presentation/splash_screen.dart';
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
          headlineMedium: TextStyle(fontSize: 25),
          displayMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 13),
        ),
        primaryColor: Color(int.parse("0xFF010536")),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF010536)),
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
    const SplashScreen(),
    const SmokeSignalScreen(),
    const RegistrationSuccessScreen(),
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
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined,
                  color: Theme.of(context).primaryColor),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.warning_outlined,
                  color: Theme.of(context).primaryColor),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.alarm, color: Theme.of(context).primaryColor),
              label: ""),
          BottomNavigationBarItem(
              icon:
                  Icon(Icons.more_vert, color: Theme.of(context).primaryColor),
              label: ""),
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
