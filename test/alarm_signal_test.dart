import 'package:p12_basic_widgets/domain/entities/alarm_signal.dart';
import 'package:test/test.dart';

void main() {
  late AlarmSignal alarmSignal;

  setUp(() {
    alarmSignal = AlarmSignal("Smoke", false);
  });

  test('Alarm ist standardmäßig nicht aktiviert', () {
    expect(alarmSignal.alarmActive, isFalse);
  });

  test('Aktiviere den Alarm', () {
    alarmSignal.activateAlarm();

    expect(alarmSignal.alarmActive, isTrue);
  });

  test('Deaktiviere den Alarm', () {
    alarmSignal.activateAlarm();

    alarmSignal.cancelAlarm();

    expect(alarmSignal.alarmActive, isFalse);
  });
}
