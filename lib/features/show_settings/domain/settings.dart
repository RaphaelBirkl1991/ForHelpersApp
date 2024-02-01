import 'package:p12_basic_widgets/features/show_settings/domain/enum_color_sheme.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_language.dart';

class Settings {
  ColorMode colorMode;
  Language appLanguage;
  Language newLanguage;

  Settings(this.colorMode, this.appLanguage, this.newLanguage);

  void setLightmode() => colorMode = ColorMode.lightmode;

  void setDarkmode() => colorMode = ColorMode.darkmode;

  void setLanguage(Language language) => appLanguage = language;
}
