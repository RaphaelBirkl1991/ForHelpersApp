import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/loading_screen.dart';
import 'package:p12_basic_widgets/pin_activated.dart';
import 'package:p12_basic_widgets/pin_creation.dart';
import 'package:p12_basic_widgets/pin_info.dart';
import 'package:p12_basic_widgets/pin_remember_hint.dart';
import 'package:p12_basic_widgets/registration.dart';
import 'package:p12_basic_widgets/registration_fail.dart';
import 'package:p12_basic_widgets/registration_success.dart';

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
          child: PinAdditionalInfoScreen(),
        ),
      ),
    );
  }
}
