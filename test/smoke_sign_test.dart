import 'package:p12_basic_widgets/domain/entities/smoke-sign.dart';
import 'package:test/test.dart';

void main() {
  // Erstelle eine Instanz der SmokeSign-Klasse für die Tests
  late SmokeSign smokeSign;

  // Diese Funktion wird vor jedem Testfall ausgeführt
  setUp(() {
    // Initialisiere die SmokeSign-Instanz mit Standardwerten
    smokeSign = SmokeSign("Smoke detected", false);
  });

  test('Rauchsignal ist standardmäßig nicht aktiviert', () {
    // Überprüfe, ob das Rauchsignal standardmäßig deaktiviert ist
    expect(smokeSign.smokeActive, isFalse);
  });

  test('Aktiviere das Rauchsignal', () {
    // Aktiviere das Rauchsignal
    smokeSign.activateSmoke();

    expect(smokeSign.smokeActive, isTrue);
  });

  test('Deaktiviere das Rauchsignal', () {
    smokeSign.activateSmoke();

    smokeSign.cancelSmoke();

    expect(smokeSign.smokeActive, isFalse);
  });
}
