import 'package:flutter/material.dart';

class AlarmProvider extends ChangeNotifier {
  bool isSignalAlarmActive = false;

  void activateSendingMode() {
    isSignalAlarmActive = true;
    notifyListeners();
  }

  void stopSendingMode() {
    isSignalAlarmActive = false;
    notifyListeners();
  }
}
