import 'package:flutter/material.dart';

class SmokeController extends ChangeNotifier {
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
