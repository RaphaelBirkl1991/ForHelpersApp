import 'package:p12_basic_widgets/features/show_settings/domain/enum_color_sheme.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_language.dart';

class Settings {
  ColorMode colorMode;
  Language language;

  Settings(this.colorMode, this.language);

  void setLightmode() => colorMode = ColorMode.lightmode;

  void setDarkmode() => colorMode = ColorMode.darkmode;

  void setLanguage(Language newLanguage) => language = newLanguage;

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      map["colorMode"],
      map["language"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "colorMode": colorMode,
      "language": language,
    };
  }
}
