import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/custom_navbar.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/splash_screen.dart';
import 'package:p12_basic_widgets/features/set_alarm/presentation/alarm_screen.dart';
import 'package:p12_basic_widgets/features/set_smoke/data/database_set_smoke_repository.dart';
import 'package:p12_basic_widgets/features/set_smoke/presentation/smoke_screen.dart';
import 'package:p12_basic_widgets/features/show_map/map_screen.dart';
import 'package:p12_basic_widgets/features/show_settings/data/database_settings_repository.dart';
import 'package:p12_basic_widgets/features/show_settings/presentation/tabbar_screen.dart';

class MainAppScreen extends StatefulWidget {
  final DatabaseSetSmokeRepository databaseSetSmokeRepository;
  final DatabaseSettingsRepository databaseSettingsRepository;
  const MainAppScreen({
    super.key,
    required this.databaseSetSmokeRepository,
    required this.databaseSettingsRepository,
  });

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainAppScreen> {
  @override
  void initState() {
    super.initState();
    pages = [
      const MapScreen(),
      SmokeSignalScreen(
          databaseSetSmokeRepository: widget.databaseSetSmokeRepository),
      const AlarmSignalScreen(),
      TabBarScreen(
          databaseSettingsRepository: widget.databaseSettingsRepository)
    ];
  }

  int _selectedIndex = 0;
  List<Widget> pages = [];
  bool isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    /*
   if(AuthenticationService.userIsAlreadyRegistered()) {
    return AuthenticationScreen(); 
    else return Scaffold....
   }
    */

    if (isAuthenticated) {
      return const SplashScreen();
    } else {
      return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: pages,
        ),
        bottomNavigationBar: CustomNavBar(
            selectedIndex: _selectedIndex, onItemTapped: onItemTapped),
      );
    }
  }

  void onItemTapped(int index) {
    if (index == 4) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TabBarScreen(
            databaseSettingsRepository: widget.databaseSettingsRepository,
          ),
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}