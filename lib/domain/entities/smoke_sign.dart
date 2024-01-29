import 'package:p12_basic_widgets/domain/enums/enum_additional_info.dart';
import 'package:p12_basic_widgets/domain/enums/enum_smoke_specification.dart';

class SmokeSign {
  bool smokeActive;
  SmokeSpecification? specification;
  List<AdditionalInformation>? addititonalInfo;

  SmokeSign(this.smokeActive, this.specification, this.addititonalInfo);
}
