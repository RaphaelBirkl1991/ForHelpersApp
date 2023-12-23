import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/logo_semi_transparent.png",
      width: 130,
      height: 130,
    );
  }
}
