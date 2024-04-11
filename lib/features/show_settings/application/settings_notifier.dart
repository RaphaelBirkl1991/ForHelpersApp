import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/app_theme.dart';
import 'package:p12_basic_widgets/features/show_map/application/map_notifier.dart';
import 'package:p12_basic_widgets/features/show_settings/data/firebase/firebase_settings_repository.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_color_sheme.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_language.dart';

class SettingsNotifier extends ChangeNotifier {
  SettingsNotifier() {
    _readCurrentThemeDataAndUpdate();
  }

  final _firebaseSettingsRepo = FirebaseSettingsRepository();
  ThemeData currentTheme = AppTheme.themeDataLightMode;
  bool isDarkmodeActive = false;
  Future<Language> getLanguage() {
    return _firebaseSettingsRepo.getLanguage();
  }

  setLanguage(Language language) {
    debugPrint("IN SETTTINGS NOTIFIER SET LANGUAGE");
    _firebaseSettingsRepo.setLanguage(language);
  }

  Future<ColorMode> getColorMode() async {
    return await _firebaseSettingsRepo.getColorMode();
  }

  Future<void> setColorMode(ColorMode colorMode) {
    debugPrint("SETTINGS NOTIFIER: SET_COLOR MODE");
    return _firebaseSettingsRepo.setColorMode(colorMode);
  }

  void changeThemeData() {
    if (currentTheme == AppTheme.themeDataLightMode) {
      currentTheme = AppTheme.themeDataLightMode;
      isDarkmodeActive = false;
    } else {
      currentTheme = AppTheme.themeDataDarkMode;
      isDarkmodeActive = true;
    }
    notifyListeners();
  }

  void _readCurrentThemeDataAndUpdate() async {
    ColorMode currentColorMode = await getColorMode();
    if (currentColorMode == ColorMode.darkmode) {
      currentTheme = AppTheme.themeDataDarkMode;
    } else {
      currentTheme = AppTheme.themeDataLightMode;
    }
    notifyListeners();
  }

  void setMapStylePioneer(MapNotifier mapNotifier) {
    mapNotifier.setMapStylePioneer();
  }

  void setMapStyleDefault(MapNotifier mapNotifier) {
    mapNotifier.setMapStyleDefault();
  }

  void setMapStyleTransportDark(MapNotifier mapNotifier) {
    mapNotifier.setMapStyleTransportDark();
  }

  void setMapStyleLandscape(MapNotifier mapNotifier) {
    mapNotifier.setMapStyleLandscape();
  }

  void setMapStyleOutdoors(MapNotifier mapNotifier) {
    mapNotifier.setMapStyleOutdoor();
  }

  void setMapStyleHighContrast(MapNotifier mapNotifier) {
    mapNotifier.setMapStyleHighContrast();
  }
}
