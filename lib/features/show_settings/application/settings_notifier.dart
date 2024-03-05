import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/show_settings/data/mock/mock_settings_repository.dart';
import 'package:p12_basic_widgets/features/show_settings/data/mock/mock_settings_service.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_color_sheme.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_language.dart';

class SettingsNotifier extends ChangeNotifier {
  late MockSettingsRepository _mockSettingsRepository;
  final _mockSettingsService = MockSettingsService();

  Future<Language> getLanguage() {
    return _mockSettingsRepository.getLanguage();
  }

  setLanguage(Language language) {
    _mockSettingsRepository.setLanguage(language);
  }

  Future<ColorMode> getColorMode() {
    return _mockSettingsRepository.getColorMode();
  }

  Future<void> setColorMode(ColorMode colorMode) {
    return _mockSettingsRepository.setColorMode(colorMode);
  }
}
