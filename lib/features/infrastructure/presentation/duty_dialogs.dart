import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/config/palette.dart';
import 'package:p12_basic_widgets/features/plant_smoke/application/smoke_notifier.dart';
import 'package:p12_basic_widgets/features/plant_smoke/presentation/smoke_drawer.dart';
import 'package:p12_basic_widgets/features/show_map/application/map_notifier.dart';
import 'package:p12_basic_widgets/features/show_map/presentation/map_screen.dart';
import 'package:provider/provider.dart';

class DutyDialogs {
  final smokeNotifier = SmokeNotifier();
  final mapScreen = const MapScreen();

  // SMOKE PLANTED
  Future<bool?> smokePlanted(BuildContext context) async {
    final mapProvider = Provider.of<MapNotifier>(context, listen: false);
    return showDialog<bool>(
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
                      // hier will ich die Methode destroyTapMarker() auslösen
                      // mapProvider.setMarkerColorYellow();
                      mapProvider.destroyTapMarker();
                      debugPrint("BEFORE POP");

                      Navigator.of(context).pop(true);
                    },
                    child: const Text(
                      "Got it!",
                      style: TextStyle(color: dutyGreen),
                    ))
              ]);
        }));
  }

  // CONFIRM SMOKE DELETION
  Future<void> confirmSmokeDeletetion(
    BuildContext context,
  ) async {
    return showDialog<void>(
      context: context,
      builder: ((context) {
        return Consumer2<SmokeNotifier, MapNotifier>(
          builder: (BuildContext context, SmokeNotifier smokeProvider,
              MapNotifier mapProvider, Widget? child) {
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
                    onPressed: () async {
                      smokeProvider.stopSendingMode();
                      mapProvider.setMarkerColorBlue();
                      smokeProvider.deleteSmokeSignal(context);
                      smokeNotifier.useCurrentCoordinates();
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
          },
        );
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
  static Future<void> smokeDetected(context) async {
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

// SHOW SMOKE DIALOG
  Future<void> showSmokeDialog(
      Function destroyGeoMarker, BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Customize GeoPoint'),
            content: const Text(
                'You can create an Smokesignal here or destroy this GeoPoint'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    smokeNotifier.useMarkerCoordinates();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                (const DrawerSmokeScreen()))));
                  },
                  child: const Text(
                    "set Smoke",
                    style: TextStyle(color: dutyYellow),
                  )),
              TextButton(
                  onPressed: () {
                    destroyGeoMarker();
                    smokeNotifier.useCurrentCoordinates();
                    Navigator.of(context).pop();
                  },
                  child: const Text("destroy GeoPoint",
                      style: TextStyle(color: dutyRed))),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('close'),
              ),
            ],
          );
        });
  }
}
