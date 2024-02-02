import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';

class DutyDialogs {
  // SMOKE PLANTED
  Future<void> smokePlanted(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: ((context) {
        return AlertDialog(
            icon: Icon(
              Icons.mobile_friendly,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Smoke planted!"),
            content: const Text(
                "Your fellows are beeing notified. You´ll be updated when someone is hitting the road."),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Got it!",
                    style: TextStyle(color: dutyGreen),
                  ))
            ]);
      }),
    );
  }

  // CONFIRM SIGN DELETION
  Future<void> confirmSmokeDeletetion(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: ((context) {
        return AlertDialog(
            icon: Icon(
              Icons.mobile_friendly,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Are you sure?"),
            content: const Text(
                "You are deleting the current sign. Is that what you want?"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Delete sign",
                  style: TextStyle(color: dutyRed),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Wait...",
                  style: TextStyle(color: dutyGreen),
                ),
              ),
            ]);
      }),
    );
  }

  // ALARM ACTIVE
  Future<void> alarmActive(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: ((context) {
        return AlertDialog(
            icon: Icon(
              Icons.mobile_friendly,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Signal active!"),
            content: const Text(
                "Your fellows are beeing notified. You´ll be updated when someone is hitting the road."),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Got it!",
                    style: TextStyle(color: dutyGreen),
                  ))
            ]);
      }),
    );
  }

  // ALARM DROPPED
  Future<void> alarmDropped(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: ((context) {
        return AlertDialog(
            icon: Icon(
              Icons.mobile_friendly,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Signal dropped!"),
            content: const Text(
                "You dont´t need help anymore. Your fellows will be updated."),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Got it!",
                    style: TextStyle(color: dutyGreen),
                  ))
            ]);
      }),
    );
  }

  // ON DUTY
  Future<void> onDuty(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: ((context) {
        return AlertDialog(
            icon: Icon(
              Icons.mobile_friendly,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("On Duty!"),
            content: const Text("Good to have you here. Stay safe"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Okay!",
                    style: TextStyle(color: dutyGreen),
                  ))
            ]);
      }),
    );
  }

  // OFF DUTY
  Future<void> offDuty(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: ((context) {
        return AlertDialog(
            icon: Icon(
              Icons.mobile_friendly,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Off Duty!"),
            content: const Text("See you next time"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Bye",
                    style: TextStyle(color: dutyRed),
                  ))
            ]);
      }),
    );
  }

  // NAVIGATION CANCELLED
  Future<void> navigationCancelled(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: ((context) {
        return AlertDialog(
            icon: Icon(
              Icons.mobile_friendly,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Navigation cancelled!"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Got it",
                    style: TextStyle(color: dutyRed),
                  ))
            ]);
      }),
    );
  }

  // SMOKE DETECTED
  Future<void> smokeDetected(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: ((context) {
        return AlertDialog(
            icon: Icon(
              Icons.mobile_friendly,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Smokesign detected!"),
            content: const Text(
                "Your fellows need your support at a PREECAUTIONARY Signal."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Dismiss",
                  style: TextStyle(color: dutyRed),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Navigate",
                  style: TextStyle(color: dutyGreen),
                ),
              ),
            ]);
      }),
    );
  }
}
