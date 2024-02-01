import 'package:p12_basic_widgets/features/show_settings/domain/enum_color_sheme.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_language.dart';

abstract class DatabaseSettingsRepository {
  Future<Language> getLanguage();
  Future<void> setLanguage(Language language);
  Future<ColorMode> getColorMode();
  Future<void> setColorMode(ColorMode mode);
}
