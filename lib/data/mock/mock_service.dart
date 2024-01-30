import 'package:p12_basic_widgets/domain/entities/smoke_sign.dart';
import 'package:p12_basic_widgets/domain/enums/enum_additional_info.dart';
import 'package:p12_basic_widgets/domain/enums/enum_smoke_specification.dart';

class MockService {
  List<SmokeSign> smokeList = [];

  void createSmokeSign(
      SmokeSpecification specification, List<AdditionalInformation>? infoList) {
    late final SmokeSign smokeEntry;
    if (infoList == null) {
      smokeEntry = SmokeSign(true, specification, []);
    } else {
      smokeEntry = SmokeSign(true, specification, infoList);
    }
    smokeList.add(smokeEntry);
    print("The Smoke List: ${smokeList.map((e) => e.toMap()).toList()}");
  }
}
