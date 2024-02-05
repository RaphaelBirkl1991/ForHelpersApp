import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/app.dart';
import 'package:p12_basic_widgets/features/plant_alarm/presentation/alarm_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(ChangeNotifierProvider(
      create: (context) => AlarmProvider(), child: const App()));
}
