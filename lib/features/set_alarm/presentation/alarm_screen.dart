import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/infrastructure/presentation/duty_dialogs.dart';

class AlarmSignalScreen extends StatefulWidget {
  const AlarmSignalScreen({super.key});

  @override
  State<AlarmSignalScreen> createState() => _AlarmSignalScreenState();
}

class _AlarmSignalScreenState extends State<AlarmSignalScreen> {
  late MaterialStatesController btnStateController;
  DutyDialogs dutyDialogs = DutyDialogs();
  bool isTriggerLocked = true;
  bool isLockBtnLocked = false;

  @override
  void initState() {
    super.initState();
    btnStateController = MaterialStatesController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Center(
          child: Text("Reactive Alarm",
              style: Theme.of(context).textTheme.headlineMedium),
        ),
        const Spacer(),
        const Spacer(),
        const Spacer(),
        const Center(
          child: Text(
              "Activate button and \nkeep trigger pressed \n to send alarmsignal"),
        ),
        const Spacer(),
        // const AlarmTriggerBtn(),
        OutlinedButton(
          onPressed: isLockBtnLocked
              ? null
              : () {
                  switchTriggerBtnState();
                  relockTriggerBtn();
                  setState(() {});
                  debugPrint("isTrgiggerLocked: $isTriggerLocked");
                },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(300, 38),
            ),
          ),
          child: isTriggerLocked
              ? Text(
                  "activate Button",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )
              : const Text("activate Button",
                  style: TextStyle(color: Colors.grey)),
        ),

        ElevatedButton(
            onPressed: isTriggerLocked
                ? null
                : () {
                    print("ALARM ACTIVATED");
                    dutyDialogs.alarmActive(context);
                  },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey;
                    }
                    return Theme.of(context).primaryColor;
                  },
                ),
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size(300, 38),
                )),
            child: isTriggerLocked
                ? const Text(
                    "send alarm",
                    style: TextStyle(color: Colors.white),
                  )
                : const Text(
                    "send alarm",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
        const Spacer(),
      ],
    );
  }

  bool switchTriggerBtnState() {
    debugPrint("$isTriggerLocked");
    isTriggerLocked = false;
    isLockBtnLocked = true;
    setState(() {});
    debugPrint(
        "Lock Butoon Locked: $isLockBtnLocked \nTrigger Button Locked: $isTriggerLocked");

    return isTriggerLocked;
  }

  Future<void> relockTriggerBtn() async {
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      isTriggerLocked = true;
      isLockBtnLocked = false;
    });
  }
}
