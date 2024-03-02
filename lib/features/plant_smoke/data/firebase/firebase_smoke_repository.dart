import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:p12_basic_widgets/config/configuration_porvider.dart';
import 'package:p12_basic_widgets/features/plant_smoke/data/database_smoke_repository.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/smoke_sign.dart';
import 'package:provider/provider.dart';

class FirebaseSmokeRepository implements DatabaseSmokeRepository {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  @override
  Future<void> createSmokeSign(SmokeSign sign) async {
    Map<String, dynamic> smokeMap = await sign.toMap();
    print(smokeMap);
    DocumentReference docRef =
        await _instance.collection("SmokeSign").add(smokeMap);
    // await _instance
    //     .collection("users")
    //     .doc("tzWbHnk7U5UKf4TJsEEZr9oWGUv1")
    //     .update({"signalId": docRef.id});
  }

  @override
  Future<void> deleteSmokeSign(context) async {
    try {
      String currentUserId =
          Provider.of<ConfigurationProvider>(context, listen: false).userId;
      final querySnapshot = await _instance
          .collection("SmokeSign")
          .where("userId", isEqualTo: currentUserId)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        await _instance.collection("SmokeSign").doc().delete();
      } else {
        print("KEIN ENTSPRECHENDEN EINTRAG IN DER DB GEFUNDEN");
      }
    } catch (e) {
      print("FEHLER BEIM LÖSCHEN");
    }
    // final data = await _instance.collection("SmokeSign").doc().get();

    // Den User auslesen
    // final data = await _instance
    //     .collection("users")
    //     .doc("tzWbHnk7U5UKf4TJsEEZr9oWGUv1")
    //     .get();
    // final signalId = data.data()!["signalId"];
    // await _instance.collection("signals").doc(signalId).delete();
    // await _instance
    //     .collection("users")
    //     .doc("tzWbHnk7U5UKf4TJsEEZr9oWGUv1")
    //     .update({"signalId": null});
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