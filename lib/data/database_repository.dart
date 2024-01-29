import 'package:p12_basic_widgets/domain/enums/enum_additional_info.dart';
import 'package:p12_basic_widgets/domain/enums/enum_smoke_specification.dart';

abstract class DatabaseRepository {
  Future<void> unleashSmokeSignal(
    SmokeSpecification specification,
    List<AdditionalInformation> additionalInfo,
  );
}
