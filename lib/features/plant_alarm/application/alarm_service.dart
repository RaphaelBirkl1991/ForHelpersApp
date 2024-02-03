import 'package:p12_basic_widgets/features/plant_alarm/domain/alarm_signal.dart';

class AlarmService {
  int id = 0;
  createAlarmSignal() {
    AlarmSignal alarmSignal = AlarmSignal();
    alarmSignal.id = ++id;
    alarmSignal.isSignalActive = true;
    alarmSignal.currentPosition?.latitude = 37.7749;
    alarmSignal.currentPosition?.longitude = -122.4194;
  }

  deactivateAlarmSignal(AlarmSignal signal) {
    signal.isSignalActive = false;
  }
}
