import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_additional_info.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_smoke_specification.dart';

class SmokeSign {
  bool signActive;
  SmokeSpecification? specification;
  List<AdditionalInformation>? addititonalInfo;

  SmokeSign(this.signActive, this.specification, this.addititonalInfo);

  Map toMap() {
    return {
      "sign active": signActive,
      "specification": specification,
      "additional info": addititonalInfo
    };
  }
}
