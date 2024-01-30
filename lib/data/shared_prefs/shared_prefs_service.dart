import 'package:p12_basic_widgets/features/set_smoke/domain/smoke_sign.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<void> unleashSmokeSignal(SmokeSign smokeSign) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    // Konvertiere die Werte von SmokeSign in einfache Datentypen
    pref.setBool('smokeActive', smokeSign.signActive);
    pref.setString('specification', smokeSign.specification?.toString() ?? '');

    // Konvertiere die List<AdditionalInformation> in eine List<String> von Enum-Namen
    List<String> additionalInfoStrings = smokeSign.addititonalInfo
            ?.map((info) => info.toString().split('.').last)
            .toList() ??
        [];
    pref.setStringList('additionalInfo', additionalInfoStrings);
  }
}
