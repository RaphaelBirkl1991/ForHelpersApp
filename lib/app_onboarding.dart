import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/app_theme.dart';
import 'package:p12_basic_widgets/features/initial_use/presentation/init_registration.dart';
import 'package:p12_basic_widgets/features/initial_use/presentation/init_splash_screen.dart';

class AppOnboarding extends StatelessWidget {
  const AppOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.themeData,
        home: const InitSplashScreen(),
        routes: {
          "/registration": (context) => const InitRegistrationScreen(),
        });
  }
}
