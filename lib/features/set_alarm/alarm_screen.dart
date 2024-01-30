import 'package:flutter/material.dart';

class AlarmSignalScreen extends StatefulWidget {
  const AlarmSignalScreen({super.key});

  @override
  State<AlarmSignalScreen> createState() => _AlarmSignalScreenState();
}

class _AlarmSignalScreenState extends State<AlarmSignalScreen> {
  late MaterialStatesController btnStateController;
  bool isTriggerLocked = true;

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
          onPressed: () {
            switchTriggerBtnState();
            relockTriggerBtn();
            setState(() {});
            print("isTrgiggerLocked: $isTriggerLocked");
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(300, 38),
            ),
          ),
          child: isTriggerLocked
              ? const Text(
                  "activate Button",
                  style: TextStyle(color: Colors.black),
                )
              : const Text("activate Button",
                  style: TextStyle(color: Colors.black)),
        ),
        ElevatedButton(
            onPressed: isTriggerLocked
                ? null
                : () {
                    print("alarm active");
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
                    style: TextStyle(color: Colors.white),
                  )),
        const Spacer(),
      ],
    );
  }

  bool switchTriggerBtnState() {
    print(isTriggerLocked);
    isTriggerLocked = !isTriggerLocked;
    setState(() {});
    print(isTriggerLocked);

    return isTriggerLocked;
  }

  Future<void> relockTriggerBtn() async {
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      isTriggerLocked = true;
    });
  }
}
