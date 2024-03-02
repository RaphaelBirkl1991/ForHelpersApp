import 'dart:async';

import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/initial_use/presentation/init_registration.dart';

class RegistrationFailScreen extends StatelessWidget {
  const RegistrationFailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const InitRegistrationScreen()),
      );
    });
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Text("Process failed!", style: TextStyle(fontSize: 26)),
            Spacer(),
            Image(
              image: AssetImage("assets/images/fail_icon.png"),
              width: 130,
              height: 130,
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
