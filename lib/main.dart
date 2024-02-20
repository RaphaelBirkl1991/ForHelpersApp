import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/app.dart';
import 'package:p12_basic_widgets/config/app_theme.dart';
import 'package:p12_basic_widgets/features/plant_alarm/application/alarm_provider.dart';
import 'package:p12_basic_widgets/features/plant_smoke/application/smoke_provider.dart';
import 'package:p12_basic_widgets/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AlarmProvider()),
        ChangeNotifierProvider(create: (context) => SmokeProvider()),
      ],
      child: MaterialApp(theme: AppTheme.themeData, home: const App()),
    ),
  );
}
