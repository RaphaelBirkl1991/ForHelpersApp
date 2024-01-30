class User {
  int id;
  bool duty;
  int compnayId;
  String companyName;

  User(this.id, this.duty, this.compnayId, this.companyName);

  void setOffDuty() => duty = false;

  void setOnDuty() => duty = true;
}
