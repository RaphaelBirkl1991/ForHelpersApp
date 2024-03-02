class RegistrationValidation {
  bool isEmailLegit(String? input) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(input ?? "");
  }

  String? emailErrorText(String? input) {
    final bool isErrorThrown = !isEmailLegit(input);
    if (isErrorThrown) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  bool isPasswordLegit(String? input) {
    // String validator = "123456";
    return input?.length == 6;
  }

  String? passwordErrorText(String? input) {
    final bool isErrorThrown = !isPasswordLegit(input);
    if (isErrorThrown) {
      return "pw not legit";
    } else {
      return null;
    }
  }
}
