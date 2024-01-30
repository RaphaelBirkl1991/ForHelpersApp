import 'package:p12_basic_widgets/features/infrastructure/domain/enum_mode.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_language.dart';

class Settings {
  Mode mode;
  Language appLanguage;
  Language newLanguage;

  Settings(this.mode, this.appLanguage, this.newLanguage);

  void setLightmode() => mode = Mode.lightmode;

  void setDarkmode() => mode = Mode.darkmode;

  void setLanguage(Language language) => appLanguage = language;
}
