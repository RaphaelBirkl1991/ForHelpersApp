import 'package:flutter/material.dart';

class AlarmController extends ChangeNotifier {
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
