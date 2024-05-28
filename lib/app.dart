import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    print("IN APP BUILD");
    return const SplashScreen();
  }
}
