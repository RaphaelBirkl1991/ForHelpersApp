import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/plant_alarm/domain/alarm_signal.dart';
import 'package:p12_basic_widgets/features/plant_alarm/domain/position.dart';

class MockAlarmService {
  final alarmSignal = AlarmSignal();
  final northPole = DutyPosition(latitude: 000.000, longitude: 000.000);

  Future<void> createAlarm() async {
    int i = 0;
    final dummyPosition = DutyPosition(latitude: 37.7749, longitude: -122.4194);
    i++;
    alarmSignal.id = i;
    alarmSignal.currentPosition = dummyPosition;
    alarmSignal.isSignalActive = true;
    await Future.delayed(const Duration(seconds: 1));
    debugPrint("\nALARMSIGNAL CREATED: \t$alarmSignal");
  }

  Future<void> deleteAlarm() async {
    alarmSignal.currentPosition = northPole;
    alarmSignal.isSignalActive = false;
    await Future.delayed(const Duration(seconds: 2));
    debugPrint("\nALARMSIGNAL DEACTIVATED: \t$alarmSignal");
  }
}
