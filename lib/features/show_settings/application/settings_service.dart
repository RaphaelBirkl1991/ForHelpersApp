import 'package:p12_basic_widgets/features/show_settings/domain/enum_language.dart';

class SettingsService {
  Language currentLanguage = Language.english;

  setLanguage(Language newLanguage) {
    currentLanguage != newLanguage
        ? currentLanguage = newLanguage
        : currentLanguage = currentLanguage;
    print("\n\nNEW LANGUAGE: \n\n$currentLanguage");
  }
}
