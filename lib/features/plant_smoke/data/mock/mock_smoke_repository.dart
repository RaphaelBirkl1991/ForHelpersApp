import 'package:p12_basic_widgets/features/plant_smoke/data/database_smoke_repository.dart';
import 'package:p12_basic_widgets/features/plant_smoke/data/mock/mock_smoke_service.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_additional_info.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_smoke_specification.dart';

class MockSmokeRepository implements DatabaseSmokeRepository {
  final MockSmokeService _mockSmokeService;

  MockSmokeRepository(this._mockSmokeService);

  @override
  Future<void> createSmokeSign(SmokeSpecification specification,
      List<AdditionalInformation> additionalInfo) async {
    await _mockSmokeService.createSmoke(specification, additionalInfo);
  }

  @override
  Future<void> deleteSmokeSign() async {
    _mockSmokeService.deleteSmoke();
  }
}
