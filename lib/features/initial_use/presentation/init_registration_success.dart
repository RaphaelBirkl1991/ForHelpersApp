import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/main_app_screen.dart';

class RegistrationSuccessScreen extends StatelessWidget {
  const RegistrationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainAppScreen()));
      // databaseSetSmokeRepository: databaseSetSmokeRepository,
      // databaseSettingsRepository: databaseSettingsRepository,
      // databaseAlarmRepository: databaseAlarmRepository
    });
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text("Successfully registrated!", style: TextStyle(fontSize: 26)),
          Spacer(),
          Center(
            child: Image(
              image: AssetImage("assets/images/success_icon.png"),
              width: 130,
              height: 130,
            ),
          ),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}
