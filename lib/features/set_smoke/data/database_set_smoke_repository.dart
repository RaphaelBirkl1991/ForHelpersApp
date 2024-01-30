import 'package:p12_basic_widgets/features/set_smoke/domain/enum_additional_info.dart';
import 'package:p12_basic_widgets/features/set_smoke/domain/enum_smoke_specification.dart';

abstract class DatabaseSetSmokeRepository {
  Future<void> createSmokeSignal(
    SmokeSpecification specification,
    List<AdditionalInformation> additionalInfo,
  );
}
