import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void configureFirebaseMessaging() {
    _firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handhabung eingehender Nachrichten, wenn die App im Vordergrund ist
      print('onMessage: $message');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handhabung eingehender Nachrichten, wenn die App im Hintergrund ist und geöffnet wird
      print('onMessageOpenedApp: $message');
    });
  }
}
