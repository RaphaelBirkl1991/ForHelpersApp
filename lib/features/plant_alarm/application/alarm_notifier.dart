import 'package:flutter/material.dart';

class AlarmNotifier extends ChangeNotifier {
  bool isAlarmActive = false;

  Future<void> activateSendingMode() async {
    isAlarmActive = true;
    notifyListeners();
  }

  Future<void> stopSendingMode() async {
    isAlarmActive = false;
    notifyListeners();
  }
}
