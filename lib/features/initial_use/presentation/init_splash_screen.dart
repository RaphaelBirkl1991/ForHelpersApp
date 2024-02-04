import 'package:flutter/material.dart';

class InitSplashScreen extends StatelessWidget {
  const InitSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/registration');
    });

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).primaryColor,
      child: const Center(
        child: Image(
          image: AssetImage("assets/images/logo.png"),
          width: 130,
          height: 130,
        ),
      ),
    );
  }
}
