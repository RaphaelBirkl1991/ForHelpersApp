import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/plant_smoke/data/firebase/firebase_smoke_repository.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_additional_info.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_smoke_specification.dart';

class SmokeProvider extends ChangeNotifier {
  final repository = FirebaseSmokeRepository();
  bool isSmokeActive = false;

  void activateSendingMode() {
    isSmokeActive = true;
    notifyListeners();
  }

  void stopSendingMode() {
    isSmokeActive = false;
    notifyListeners();
  }

  Future<void> createSmokeSingal(SmokeSpecification specification,
      List<AdditionalInformation> additionalInfo) async {
    debugPrint("\nSMOKE PROVIDER CREATE SMOKESIGNAL\n");
    repository.createSmokeSign(specification, additionalInfo);
  }

  Future<void> deleteSmokeSignal() async {
    debugPrint("\nSMOKE PROVIDER DELETE SMOKESIGNAL\n");
    repository.deleteSmokeSign();
  }
}
