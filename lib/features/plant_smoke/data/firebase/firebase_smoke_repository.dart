import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:p12_basic_widgets/config/configuration_porvider.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/plant_smoke/data/smoke_repository.dart';
import 'package:p12_basic_widgets/features/plant_smoke/domain/smoke_sign.dart';
import 'package:provider/provider.dart';

class FirebaseSmokeRepository implements SmokeRepository {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  @override
  Stream<List<SmokeSign>> get smokeSign {
    return FirebaseFirestore.instance
        .collection("SmokeSign")
        .snapshots()
        .map((snapshot) {
      log("${ansiGreen}COLLECTION CHANGED$ansiGreenEnd");
      return snapshot.docs.map((entry) {
        log("${ansiGreen}DOKUMENT CHANGED$ansiGreenEnd");
        return SmokeSign.fromMap(entry.data());
      }).toList();
    });
  }

  // static void get() {
  //   //  var logger = Logger();
  //   FirebaseFirestore.instance
  //       .collection("SmokeSign")
  //       .snapshots()
  //       .listen((snapshot) {
  //     if (snapshot.docs.isNotEmpty) {
  // debugPrint(
  //     "${ansiGreen}LISTENER TRIGGERED SMOKESIGNAL IS NOT EMPTY$ansiGreenEnd");
  // logger.d("in start Listening");
  // Gib dem Repo bescheid das dem Notfier das dem UI
  //     }
  //   });
  // }

  @override
  Future<void> createSmokeSign(SmokeSign sign) async {
    Map<String, dynamic> smokeMap = sign.toMap();
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
      print("${ansiGreen}DELETE SMOKESIGNAL FB SMOKE_REPO$ansiGreenEnd");
      String currentUserId =
          Provider.of<ConfigurationProvider>(context, listen: false).userId;
      final querySnapshot = await _instance
          .collection("SmokeSign")
          .where("user_id", isEqualTo: currentUserId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final docId = querySnapshot.docs.first.id;
        await _instance.collection("SmokeSign").doc(docId).delete();
        print("QUERY SNAP IS NOT EMPTY");
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