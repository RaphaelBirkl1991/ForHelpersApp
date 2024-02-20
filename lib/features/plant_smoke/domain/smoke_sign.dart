import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_additional_info.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_smoke_specification.dart';

class SmokeSign {
  bool signActive;
  SmokeSpecification? specification;
  List<AdditionalInformation>? addititonalInfo;
  // Position position;

  SmokeSign(this.signActive, this.specification, this.addititonalInfo);

  Map<String, dynamic> toMap() {
    return {
      "sign_active": signActive,
      "specification": specification.toString(),
      "additional_info": addititonalInfo != null
          ? addititonalInfo!.map((e) => e.toString()).toList()
          : []
    };
  }
}
