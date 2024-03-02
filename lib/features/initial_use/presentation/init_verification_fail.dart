import 'dart:async';

import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/initial_use/presentation/init_verification.dart';

class VerficationFailScreen extends StatelessWidget {
  const VerficationFailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const VerificationScreen()),
      );
    });
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
