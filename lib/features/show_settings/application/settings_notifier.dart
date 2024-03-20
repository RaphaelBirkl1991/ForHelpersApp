import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/show_settings/data/firebase/firebase_settings_repository.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_color_sheme.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_language.dart';

class SettingsNotifier extends ChangeNotifier {
  final _firebaseSettingsRepo = FirebaseSettingsRepository();
  // final _mockSettingsService = MockSettingsService();

  Future<Language> getLanguage() {
    return _firebaseSettingsRepo.getLanguage();
  }

  setLanguage(Language language) {
    _firebaseSettingsRepo.setLanguage(language);
  }

  Future<ColorMode> getColorMode() {
    return _firebaseSettingsRepo.getColorMode();
  }

  Future<void> setColorMode(ColorMode colorMode) {
    return _firebaseSettingsRepo.setColorMode(colorMode);
  }
}
