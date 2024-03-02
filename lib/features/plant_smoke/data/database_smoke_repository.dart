import 'package:p12_basic_widgets/features/plant_smoke/domain/smoke_sign.dart';

abstract class DatabaseSmokeRepository {
  Future<void> createSmokeSign(SmokeSign smokeSign);

  Future<void> deleteSmokeSign(context);
}
