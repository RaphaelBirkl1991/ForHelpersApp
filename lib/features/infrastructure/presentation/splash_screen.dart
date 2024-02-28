import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/configuration_porvider.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/main_app_screen.dart';
import 'package:p12_basic_widgets/features/initial_use/presentation/init_registration.dart';
import 'package:p12_basic_widgets/features/plant_alarm/data/database_alarm_repository.dart';
import 'package:p12_basic_widgets/features/plant_alarm/data/mock/mock_alarm_repository.dart';
import 'package:p12_basic_widgets/features/plant_alarm/data/mock/mock_alarm_service.dart';
import 'package:p12_basic_widgets/features/plant_smoke/data/firebase/firebase_smoke_repository.dart';
import 'package:p12_basic_widgets/features/plant_smoke/data/mock/mock_smoke_service.dart';
import 'package:p12_basic_widgets/features/show_settings/data/database_settings_repository.dart';
import 'package:p12_basic_widgets/features/show_settings/data/mock/mock_settings_repository.dart';
import 'package:p12_basic_widgets/features/show_settings/data/mock/mock_settings_service.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mockSmokeService = MockSmokeService();
    FirebaseSmokeRepository databaseSetSmokeRepository =
        FirebaseSmokeRepository();

    final mockAlarmService = MockAlarmService();
    DatabaseAlarmRepository databaseAlarmRepository =
        MockAlarmRepository(mockAlarmService);

    final mockSettingsService = MockSettingsService();
    DatabaseSettingsRepository databaseSettingsRepository =
        MockSettingsRepository(mockSettingsService);

    Future.delayed(const Duration(seconds: 1), () {
      if (ConfigurationProvider.isFirstUse) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const InitRegistrationScreen()));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => MainAppScreen(
                  databaseSetSmokeRepository: databaseSetSmokeRepository,
                  databaseSettingsRepository: databaseSettingsRepository,
                  databaseAlarmRepository: databaseAlarmRepository,
                )));
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
