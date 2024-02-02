import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/logo_white_bg.png",
          width: 100,
          height: 100,
        ),
        const SizedBox(height: 25),
        Text(
          "ForHelpers - Mobile App Project",
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 45),
        Text(
            "Raphael Birkl \nBaldurstraße 9a \n86561 Aresing"
            "\nEmail: raphael.birkl@gmail.com \nTel: 017662705203",
            style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
