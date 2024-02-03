// import 'package:flutter/material.dart';
// import 'package:p12_basic_widgets/features/set_alarm/domain/alarm_signal.dart';
// import 'package:p12_basic_widgets/features/set_smoke/domain/enum_additional_info.dart';
// import 'package:p12_basic_widgets/features/set_smoke/domain/enum_smoke_specification.dart';
// import 'package:p12_basic_widgets/features/set_smoke/domain/smoke_sign.dart';

// class MockService {
//   //Database
//   List<SmokeSign> smokeList = [];
//   List<AlarmSignal> alarmSignal = [];

//   void createSmokeSign(
//       SmokeSpecification specification, List<AdditionalInformation>? infoList) {
//     late final SmokeSign smokeEntry;
//     if (infoList == null) {
//       smokeEntry = SmokeSign(true, specification, []);
//     } else {
//       smokeEntry = SmokeSign(true, specification, infoList);
//     }
//     smokeList.add(smokeEntry);
//     debugPrint(
//         "\n\nTHE SMOKE SIGNAL LIST:\n\n ${smokeList.map((e) => e.toMap()).toList()}");
//   }
// }
