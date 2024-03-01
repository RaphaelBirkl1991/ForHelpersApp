import 'package:flutter/material.dart';

class InitialUseProvider extends ChangeNotifier {
  bool isEmailFilled = false;
  bool isPasswordFilled = false;
  bool isRegisterBtnEnabled = false;
  void fillEmailField() {
    isEmailFilled = true;
    notifyListeners();
    debugPrint("EMAIL FIELD FILLED");
    if (isPasswordFilled) {
      handleRegisterBtn();
    }
  }

  void fillPasswordField() {
    isPasswordFilled = true;
    notifyListeners();
    debugPrint("PASSWORD FIELD FILLED");
    if (isEmailFilled) {
      handleRegisterBtn();
    }
  }

  void handleRegisterBtn() {
    if (isEmailFilled && isPasswordFilled) {
      isRegisterBtnEnabled = true;
      notifyListeners();
    }
  }
}
