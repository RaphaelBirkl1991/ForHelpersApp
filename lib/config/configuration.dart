class Configuration {
  static bool isSignalAlarmActive = false;
  static late Function(bool) onStateChanged;

  static activateSendingMode() {
    isSignalAlarmActive = true;
    notifyListeners();
  }

  static stopSendingMode() {
    isSignalAlarmActive = false;
    notifyListeners();
  }

  static notifyListeners() {
    onStateChanged.call(isSignalAlarmActive);
  }
}
