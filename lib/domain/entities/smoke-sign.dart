import 'package:p12_basic_widgets/domain/enums/enum_smoke_specification.dart';

class SmokeSign {
  String description;
  bool smokeActive;
  SmokeSpecification? specification;
  List<String>? addititonalInfo;

  SmokeSign(this.description, this.smokeActive, this.specification,
      this.addititonalInfo);

  void activateSmoke() => smokeActive = true;

  void cancelSmoke() => smokeActive = false;
}
