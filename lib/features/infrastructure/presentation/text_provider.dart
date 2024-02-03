class TextProvider {
  String alarmScreenDescrptionTxt(bool isAlarmActive) {
    return isAlarmActive
        ? "Activate Button and \nkeep trigger pressed \n to cancel alarmsignal"
        : "Activate button and \nkeep trigger pressed \n to send alarmsignal";
  }

  String alarmScreenHeadlineTxt(bool isAlarmActive) {
    return isAlarmActive ? "Reactive Alarm" : "Alarm Active!";
  }
}
