import 'package:p12_basic_widgets/data/database_repository.dart';
import 'package:p12_basic_widgets/domain/enums/enum_additional_info.dart';
import 'package:p12_basic_widgets/domain/enums/enum_smoke_specification.dart';

class MockRepository implements DatabaseRepository {
  @override
  Future<void> createSmokeSignal(SmokeSpecification specification,
      List<AdditionalInformation> additionalInfo) {
    // TODO: implement unleashSmokeSignal
    throw UnimplementedError();
  }
}
