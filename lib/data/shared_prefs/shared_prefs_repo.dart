import 'package:p12_basic_widgets/domain/enums/enum_additional_info.dart';
import 'package:p12_basic_widgets/domain/enums/enum_smoke_specification.dart';
import 'package:p12_basic_widgets/features/set_smoke/data/database_set_smoke_repository.dart';

class SharedPreferencesRepository implements DatabaseSetSmokeRepository {
  @override
  Future<void> createSmokeSignal(SmokeSpecification specification,
      List<AdditionalInformation> additionalInfo) {
    // TODO: implement unleashSmokeSignal
    throw UnimplementedError();
  }
}
