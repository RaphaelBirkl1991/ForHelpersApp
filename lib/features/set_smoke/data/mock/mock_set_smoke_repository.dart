import 'package:p12_basic_widgets/common/mock_service.dart';
import 'package:p12_basic_widgets/features/set_smoke/data/database_set_smoke_repository.dart';
import 'package:p12_basic_widgets/features/set_smoke/domain/enum_additional_info.dart';
import 'package:p12_basic_widgets/features/set_smoke/domain/enum_smoke_specification.dart';

class MockSetSmokeRepository implements DatabaseSetSmokeRepository {
  final MockService _mockService;
  MockSetSmokeRepository(this._mockService);
  @override
  Future<void> createSmokeSignal(SmokeSpecification specification,
      List<AdditionalInformation> additionalInfo) async {
    _mockService.createSmokeSign(specification, additionalInfo);
  }
}
