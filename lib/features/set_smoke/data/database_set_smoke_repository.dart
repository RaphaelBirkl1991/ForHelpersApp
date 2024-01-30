import 'package:p12_basic_widgets/domain/enums/enum_additional_info.dart';
import 'package:p12_basic_widgets/domain/enums/enum_smoke_specification.dart';

abstract class DatabaseSetSmokeRepository {
  Future<void> createSmokeSignal(
    SmokeSpecification specification,
    List<AdditionalInformation> additionalInfo,
  );
}
