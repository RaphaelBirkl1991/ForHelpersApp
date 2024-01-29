import 'package:flutter/material.dart';

enum BtnStates { activate, alarm }

class AlarmTriggerBtn extends StatefulWidget {
  const AlarmTriggerBtn({super.key});

  @override
  State<AlarmTriggerBtn> createState() => _AlarmTriggerBtnState();
}

class _AlarmTriggerBtnState extends State<AlarmTriggerBtn> {
  BtnStates btnView = BtnStates.activate;
  bool isLockBtnEnabled = true;
  bool isTriggerBtnEnabled = false;

  bool toggleLockBtn() {
    isLockBtnEnabled = !isLockBtnEnabled;
    print("lock-btn pressed");
    //  setState(() {});
    return isLockBtnEnabled;
  }

  void toggleTriggerBtn() {
    isTriggerBtnEnabled = !isTriggerBtnEnabled;
    print("btn cklicked");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<BtnStates>(
      segments: <ButtonSegment<BtnStates>>[
        ButtonSegment<BtnStates>(
          enabled: toggleLockBtn(),
          value: BtnStates.activate,
          label: const Text('activate'),
          icon: null,
        ),
        ButtonSegment<BtnStates>(
          enabled: isTriggerBtnEnabled,
          value: BtnStates.alarm,
          label: const Text('alarmsignal'),
          icon: null,
        ),
      ],
      selected: <BtnStates>{btnView},
      onSelectionChanged: (Set<BtnStates> newSelection) {
        setState(() {
          if (newSelection.contains(BtnStates.activate)) {
            btnView = BtnStates.activate;
            toggleLockBtn();
          } else if (newSelection.contains(BtnStates.alarm)) {
            // Wenn "alarmsignal" ausgewählt wurde, ändere die Ansicht entsprechend
            btnView = BtnStates.alarm;
            toggleTriggerBtn();
          }
        });
      },
    );
  }
}
