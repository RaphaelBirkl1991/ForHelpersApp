import 'package:flutter/material.dart';

class SmokeProvider extends ChangeNotifier {
  bool isSmokeActive = false;

  void activateSendingMode() {
    isSmokeActive = true;
    notifyListeners();
  }

  void stopSendingMode() {
    isSmokeActive = false;
    notifyListeners();
  }
}
