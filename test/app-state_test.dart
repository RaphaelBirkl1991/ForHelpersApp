import 'package:p12_basic_widgets/entities/app-state.dart';
import 'package:p12_basic_widgets/enums/enum_app-state.dart';
import 'package:test/test.dart';

void main() {
  late Application application;

  setUp(() {
    application = Application(AppState.locked);
  });

  test('App startet standardmäßig im gesperrten Zustand', () {
    expect(application.appState, equals(AppState.locked));
  });

  test('Entsperre die App', () {
    application.unlockApp();

    expect(application.appState, equals(AppState.unlocked));
  });

  test('Sperre die App', () {
    application.lockApp();

    expect(application.appState, equals(AppState.locked));
  });

  test('Setze den Alarm in der App', () {
    application.setAlarm();

    expect(application.appState, equals(AppState.alarmActive));
  });

  test('Setze das Rauchsignal in der App', () {
    application.setSmokeSign();

    expect(application.appState, equals(AppState.smokeActive));
  });
}
