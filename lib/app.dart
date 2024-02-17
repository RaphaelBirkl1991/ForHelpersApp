import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/app_theme.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // final mockSmokeService = MockSmokeService();
    // DatabaseSmokeRepository databaseSetSmokeRepository =
    //     MockSmokeRepository(mockSmokeService);

    // final mockAlarmService = MockAlarmService();
    // DatabaseAlarmRepository databaseAlarmRepository =
    //     MockAlarmRepository(mockAlarmService);

    // final mockSettingsService = MockSettingsService();
    // DatabaseSettingsRepository databaseSettingsRepository =
    //     MockSettingsRepository(mockSettingsService);

    return MaterialApp(
      theme: AppTheme.themeData,
      home: const SplashScreen(),
      // MainAppScreen(
      //   databaseSetSmokeRepository: databaseSetSmokeRepository,
      //   databaseSettingsRepository: databaseSettingsRepository,
      //   databaseAlarmRepository: databaseAlarmRepository,
      // ),
    );
  }
}
