import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_color_sheme.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_language.dart';

class MockSettingsService {
  // DATABASE
  Language _currentLanguage = Language.english;
  ColorMode _currentColorMode = ColorMode.lightmode;

  Language get language {
    return _currentLanguage;
  }

  set language(Language newLanguage) {
    _currentLanguage != newLanguage
        ? _currentLanguage = newLanguage
        : _currentLanguage = _currentLanguage;
    debugPrint("\nNEW LANGUAGE: \t\t$_currentLanguage\n");
  }

  ColorMode get colorMode {
    return _currentColorMode;
  }

  set colorMode(ColorMode newMode) {
    _currentColorMode != newMode
        ? _currentColorMode = newMode
        : _currentColorMode = _currentColorMode;
    debugPrint("\nNEW COLORMODE: \t\t$_currentColorMode\n");
  }
}
