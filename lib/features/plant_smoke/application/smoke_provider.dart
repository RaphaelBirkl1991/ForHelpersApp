import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/plant_smoke/data/firebase/firebase_smoke_repository.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/smoke_sign.dart';

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

  Future<void> createSmokeSingal(SmokeSign smokeSign) async {
    debugPrint("\nSMOKE PROVIDER CREATE SMOKESIGNAL\n");
    repository.createSmokeSign(smokeSign);
  }

  Future<void> deleteSmokeSignal() async {
    debugPrint("\nSMOKE PROVIDER DELETE SMOKESIGNAL\n");
    repository.deleteSmokeSign();
  }
}
