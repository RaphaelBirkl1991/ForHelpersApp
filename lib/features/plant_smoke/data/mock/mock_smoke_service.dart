import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_additional_info.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_smoke_specification.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/smoke_sign.dart';

class MockSmokeService {
  late SmokeSign smokeSign;

  Future<void> createSmoke(SmokeSpecification specification,
      List<AdditionalInformation> infoList) async {
    await Future.delayed(const Duration(seconds: 2));
    smokeSign = SmokeSign(true, specification, infoList);
    Map smokeMap = smokeSign.toMap();

    debugPrint("\nSMOKE SIGN CREATED: \t$smokeMap");
  }

  Future<void> deleteSmoke() async {
    smokeSign = SmokeSign(false, null, null);
    debugPrint("SMOKE SIGN DELTED: \t$smokeSign");
  }
}
