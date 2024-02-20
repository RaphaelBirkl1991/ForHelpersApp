import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:p12_basic_widgets/features/plant_smoke/data/database_smoke_repository.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_additional_info.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/enum_smoke_specification.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/smoke_sign.dart';

class FirebaseSmokeRepository implements DatabaseSmokeRepository {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  @override
  Future<void> createSmokeSign(SmokeSpecification specification,
      List<AdditionalInformation> additionalInfo) async {
    final smokeSign = SmokeSign(true, specification, additionalInfo);
    Map<String, dynamic> smokeMap = smokeSign.toMap();
    print(smokeMap);
    DocumentReference docRef =
        await _instance.collection("signals").add(smokeMap);
    await _instance
        .collection("users")
        .doc("tzWbHnk7U5UKf4TJsEEZr9oWGUv1")
        .update({"signalId": docRef.id});
  }

  @override
  Future<void> deleteSmokeSign() async {
    // Den User auslesen
    final data = await _instance
        .collection("users")
        .doc("tzWbHnk7U5UKf4TJsEEZr9oWGUv1")
        .get();
    final signalId = data.data()!["signalId"];
    await _instance.collection("signals").doc(signalId).delete();
    await _instance
        .collection("users")
        .doc("tzWbHnk7U5UKf4TJsEEZr9oWGUv1")
        .update({"signalId": null});
  }
}
// tzWbHnk7U5UKf4TJsEEZr9oWGUv1

// LEGENDE

/*

LESEN: _instance.collection("users").doc(id).get(map); // LESEN

WRITE: _instance.collection("users").add(map); // NEUES DOKUMENT ERSTELLEN UND SCHREIBEN
       _instance.collection("users").set(map); // BESTEHENDES DOKUMENT ÜBERSCHREIBEN

UPDATE: _instance.collection("users").doc(id).update(map);

DELETE: _instance.collection("users").doc(id).delete();

*/