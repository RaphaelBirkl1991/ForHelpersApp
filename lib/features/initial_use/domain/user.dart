class User {
  int id;
  int personalPin;
  bool duty;
  int compnayId;
  String companyName;

  User(this.id, this.personalPin, this.duty, this.compnayId, this.companyName);

  void setOffDuty() => duty = false;

  void setOnDuty() => duty = true;
}
