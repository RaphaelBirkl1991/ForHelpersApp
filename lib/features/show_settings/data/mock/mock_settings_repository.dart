import 'package:p12_basic_widgets/features/show_settings/data/database_settings_repository.dart';
import 'package:p12_basic_widgets/features/show_settings/data/mock/mock_settings_service.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_color_sheme.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_language.dart';

class MockSettingsRepository implements DatabaseSettingsRepository {
  final MockSettingsService _mockSettingsService;
  MockSettingsRepository(this._mockSettingsService);

  @override
  Future<void> setColorMode(ColorMode mode) async {
    _mockSettingsService.colorMode = mode;
  }

  @override
  Future<void> setLanguage(Language language) async {
    Future.delayed(const Duration(seconds: 2));
    _mockSettingsService.language = language;
  }

  @override
  Future<ColorMode> getColorMode() async {
    return _mockSettingsService.colorMode;
  }

  @override
  Future<Language> getLanguage() async {
    return _mockSettingsService.language;
  }
}
