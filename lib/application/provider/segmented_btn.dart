import 'package:flutter/material.dart';

enum BtnStates { activate, alarm }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  BtnStates btnView = BtnStates.activate;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<BtnStates>(
      segments: const <ButtonSegment<BtnStates>>[
        ButtonSegment<BtnStates>(
          value: BtnStates.activate,
          label: Text('activate'),
        ),
        ButtonSegment<BtnStates>(
          value: BtnStates.alarm,
          label: Text('alarmsignal'),
        ),
      ],
      selected: <BtnStates>{btnView},
      onSelectionChanged: (Set<BtnStates> newSelection) {
        setState(() {
          if (newSelection.contains(BtnStates.activate)) {
            // Wenn "activate" ausgewählt wurde, ermögliche das Klicken auf "alarmsignal"
            btnView = BtnStates.activate;
          } else if (newSelection.contains(BtnStates.alarm)) {
            // Wenn "alarmsignal" ausgewählt wurde, ändere die Ansicht entsprechend
            btnView = BtnStates.alarm;
          }
        });
      },
    );
  }
}
