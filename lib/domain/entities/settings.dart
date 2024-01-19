import 'package:p12_basic_widgets/domain/enums/enum_language.dart';
import 'package:p12_basic_widgets/domain/enums/enum_mode.dart';

class Settings {
  Mode mode;
  Language appLanguage;
  Language newLanguage;

  Settings(this.mode, this.appLanguage, this.newLanguage);

  void setLightmode() => mode = Mode.lightmode;

  void setDarkmode() => mode = Mode.darkmode;

  void setLanguage(Language language) => appLanguage = language;
}
