import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:p12_basic_widgets/features/show_settings/data/database_settings_repository.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_color_sheme.dart';
import 'package:p12_basic_widgets/features/show_settings/domain/enum_language.dart';

class FirebaseSettingsRepository implements DatabaseSettingsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<ColorMode> getColorMode() async {
    final settingsCol = _firestore.collection("Settings");
    final colorModeDoc = await settingsCol.doc("colorMode").get();

    if (colorModeDoc.exists) {
      final Map<String, dynamic>? data = colorModeDoc.data();
      final String? colorModeString = data?["colorMode"];

      if (colorModeString == "lightmode") {
        return ColorMode.lightmode;
      } else if (colorModeString == "darkmode") {
        return ColorMode.darkmode;
      } else {
        return ColorMode.lightmode;
      }
    }
    return ColorMode.lightmode;
  }

  @override
  Future<Language> getLanguage() async {
    final settingsCol = _firestore.collection("Settings");
    final languageDoc = await settingsCol.doc("language").get();

    if (languageDoc.exists) {
      final data = languageDoc.data();
      final String? langString = data?["language"];
      if (langString == "english") {
        return Language.english;
      } else if (langString == "german") {
        return Language.german;
      }
    }
    return Language.english;
  }

  @override
  Future<void> setColorMode(ColorMode mode) async {
    final settingsColRef = _firestore.collection("Settings");
    if (mode == ColorMode.lightmode) {
      await settingsColRef.doc("colorMode").update({
        "colorMode": "lightmode",
      });
    } else if (mode != ColorMode.lightmode) {
      await settingsColRef.doc("colorMode").update({
        "colorMode": "darkmode",
      });
    }
  }

  @override
  Future<void> setLanguage(Language language) async {
    final settingsColRef = _firestore.collection("Settings");
    if (language == Language.english) {
      await settingsColRef.doc("language").update({
        "language": "english",
      });
    } else if (language != Language.english) {
      await settingsColRef.doc("language").update({
        "language": "german",
      });
    }
  }
}
