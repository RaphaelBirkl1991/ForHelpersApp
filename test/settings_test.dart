import 'package:p12_basic_widgets/features/infrastructure/domain/enum_mode.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_language.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/settings.dart';
import 'package:test/test.dart';

void main() {
  late Settings settings;

  setUp(() {
    settings = Settings(Mode.lightmode, Language.english, Language.english);
  });

  test('Einstellungen starten standardmäßig im Light Mode', () {
    expect(settings.mode, equals(Mode.lightmode));
  });

  test('Setze auf Dark Mode', () {
    settings.setDarkmode();

    expect(settings.mode, equals(Mode.darkmode));
  });

  test('Setze Sprache', () {
    settings.setLanguage(Language.german);

    expect(settings.appLanguage, equals(Language.german));
  });
}
