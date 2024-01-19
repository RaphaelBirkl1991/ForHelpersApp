class AlarmSignal {
  String description;
  bool alarmActive;

  AlarmSignal(this.description, this.alarmActive);

  void activateAlarm() => alarmActive = true;

  void cancelAlarm() => alarmActive = false;
}
