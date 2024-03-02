import 'package:flutter/material.dart';

class AlarmProvider extends ChangeNotifier {
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
