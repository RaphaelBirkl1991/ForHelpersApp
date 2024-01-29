import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(
          "assets/images/logo_white_bg.png",
          width: 100,
          height: 100,
        ),
        const Spacer(),
        const Text(
          "ForHelpers - Mobile App Project",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Text("Raphael Birkl \nBaldurstraße 9a \n86561 Aresing"
            "\nEmail: raphael.birkl@gmail.com \nTel: 017662705203"),
        const Spacer(),
        const Spacer(),
        const Spacer(),
        const Spacer(),
      ],
    );
  }
}
