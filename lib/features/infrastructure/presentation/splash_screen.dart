import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/configuration_porvider.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/main_app_screen.dart';
import 'package:p12_basic_widgets/features/initial_use/presentation/init_registration.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      if (ConfigurationProvider.isFirstUse) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const InitRegistrationScreen()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainAppScreen()));
      }
    });

    return MaterialApp(
      home: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).primaryColor,
          child: const Center(
              child: Image(
            image: AssetImage("assets/images/logo.png"),
            width: 130,
            height: 130,
          ))),
    );
  }
}
