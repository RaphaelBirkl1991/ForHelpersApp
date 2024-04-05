import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/show_map/application/map_notifier.dart';
import 'package:p12_basic_widgets/features/show_settings/data/firebase/firebase_settings_repository.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_color_sheme.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_language.dart';

class SettingsNotifier extends ChangeNotifier {
  final _firebaseSettingsRepo = FirebaseSettingsRepository();

  Future<Language> getLanguage() {
    return _firebaseSettingsRepo.getLanguage();
  }

  setLanguage(Language language) {
    debugPrint("IN SETTTINGS NOTIFIER SET LANGUAGE");
    _firebaseSettingsRepo.setLanguage(language);
  }

  Future<ColorMode> getColorMode() {
    return _firebaseSettingsRepo.getColorMode();
  }

  Future<void> setColorMode(ColorMode colorMode) {
    debugPrint("DETTINGS NOTIFIER: SET_COLOR MODE");
    return _firebaseSettingsRepo.setColorMode(colorMode);
  }

  void setMapStylePioneer(MapNotifier mapNotifier) {
    mapNotifier.setMapStylePioneer();
  }

  void setMapStyleDefault(MapNotifier mapNotifier) {
    mapNotifier.setMapStyleDefault();
  }
}
