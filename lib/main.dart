import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/screens/loading_screen.dart';
import 'package:p12_basic_widgets/screens/pin_activated.dart';
import 'package:p12_basic_widgets/screens/pin_creation.dart';
import 'package:p12_basic_widgets/screens/pin_info.dart';
import 'package:p12_basic_widgets/screens/pin_additional_info.dart';
import 'package:p12_basic_widgets/screens/registration.dart';
import 'package:p12_basic_widgets/screens/registration_fail.dart';
import 'package:p12_basic_widgets/screens/registration_success.dart';
import 'package:p12_basic_widgets/screens/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SplashScreen(),
        ),
      ),
    );
  }
}
