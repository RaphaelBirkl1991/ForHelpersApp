import 'package:flutter/material.dart';

class AlarmController extends ChangeNotifier {
  bool isAlarmActive = false;

  void activateSendingMode() {
    isAlarmActive = true;
    notifyListeners();
  }

  void stopSendingMode() {
    isAlarmActive = false;
    notifyListeners();
  }
}
