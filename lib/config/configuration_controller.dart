import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ConfigurationController extends ChangeNotifier {
  static bool isFirstUse = false;
  late String userId;

  ConfigurationController() {
    getUserId();
  }

  void getUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    userId = user?.uid ?? "";
    notifyListeners();
  }
}
