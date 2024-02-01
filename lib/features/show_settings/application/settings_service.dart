import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_color_sheme.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_language.dart';

class SettingsService {
  Language currentLanguage = Language.english;
  ColorMode currentMode = ColorMode.lightmode;

  setLanguage(Language newLanguage) {
    currentLanguage != newLanguage
        ? currentLanguage = newLanguage
        : currentLanguage = currentLanguage;
    debugPrint("\nNEW LANGUAGE: \t\t$currentLanguage\n");
  }

  setColorMode(ColorMode newMode) {
    currentMode != newMode ? currentMode = newMode : currentMode = currentMode;
    debugPrint("\nNEW COLORMODE: \t\t$currentMode\n");
  }
}
