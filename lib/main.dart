import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/app.dart';
import 'package:p12_basic_widgets/config/configuration_porvider.dart';
import 'package:p12_basic_widgets/features/initial_use/applicatiopn/init_use_provider.dart';
import 'package:p12_basic_widgets/features/plant_alarm/application/alarm_notifier.dart';
import 'package:p12_basic_widgets/features/plant_smoke/application/smoke_notifier.dart';
import 'package:p12_basic_widgets/features/show_map/application/map_notifier.dart';
import 'package:p12_basic_widgets/features/show_settings/application/settings_notifier.dart';
import 'package:p12_basic_widgets/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await initializeNotifications();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => InitialUseProvider()),
        ChangeNotifierProvider(create: (context) => AlarmNotifier()),
        ChangeNotifierProvider(create: (context) => SmokeNotifier()),
        ChangeNotifierProvider(create: (context) => MapNotifier()),
        ChangeNotifierProvider(create: (context) => ConfigurationProvider()),
        ChangeNotifierProvider(create: (context) => SettingsNotifier()),
      ],
      builder: (context, child) {
        final settingNotifier = Provider.of<SettingsNotifier>(context);
        return MaterialApp(
            theme: settingNotifier.currentTheme, home: const App());
      },
    ),
  );
  // Future<void> onDidReceiveLocalNotification(
  //     int id, String title, String body, String payload) async {
  //   // Hier könntest du Code einfügen, um die Benachrichtigung zu verarbeiten
  //   print('Benachrichtigung empfangen: $title, $body');
  // }

  // Future<void> initializeNotifications() async {
  //   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //       FlutterLocalNotificationsPlugin();
  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings('app_icon');
  //   final DarwinInitializationSettings initializationSettingsDarwin =
  //       DarwinInitializationSettings(
  //           onDidReceiveLocalNotification: onDidReceiveLocalNotification);
  //   const LinuxInitializationSettings initializationSettingsLinux =
  //       LinuxInitializationSettings(defaultActionName: 'Open notification');
  //   final InitializationSettings initializationSettings =
  //       InitializationSettings(
  //           android: initializationSettingsAndroid,
  //           iOS: initializationSettingsDarwin,
  //           macOS: initializationSettingsDarwin,
  //           linux: initializationSettingsLinux);
  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //       onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  // }
}
