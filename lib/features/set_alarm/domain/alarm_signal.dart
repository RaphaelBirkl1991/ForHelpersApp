import 'package:p12_basic_widgets/features/set_alarm/domain/position.dart';

class AlarmSignal {
  int? id;
  bool? isSignalActive;
  Position? currentPosition;

  AlarmSignal();

  void activateAlarm() => isSignalActive = true;

  void cancelAlarm() => isSignalActive = false;
}
