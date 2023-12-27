import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Image.asset(
          "assets/images/logo_white_bg.png",
          width: 100,
          height: 100,
        ),
        Spacer(),
        Text(
          "ForHelpers - Mobile App Project",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text("Raphael Birkl \nBaldurstraße 9a \n86561 Aresing" +
            "\nEmail: raphael.birkl@gmail.com \nTel: 017662705203"),
        Spacer(),
        Spacer(),
        Spacer(),
        Spacer(),
      ],
    );
  }
}
