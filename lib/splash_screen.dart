import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(int.parse("0xFF010536")),
        child: const Center(
            child: Image(
          image: AssetImage("assets/images/logo.png"),
          width: 130,
          height: 130,
        )));
  }
}
