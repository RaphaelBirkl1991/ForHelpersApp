import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_additional_info.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_smoke_specification.dart';

abstract class DatabaseSmokeRepository {
  Future<void> createSmokeSign(
    SmokeSpecification specification,
    List<AdditionalInformation> additionalInfo,
  );

  Future<void> deleteSmokeSign();
}
