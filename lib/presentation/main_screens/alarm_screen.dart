import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/application/provider/alarm_trigger_btn.dart';

class AlarmSignalScreen extends StatefulWidget {
  const AlarmSignalScreen({super.key});

  @override
  State<AlarmSignalScreen> createState() => _AlarmSignalScreenState();
}

class _AlarmSignalScreenState extends State<AlarmSignalScreen> {
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
        const AlarmTriggerBtn(),
        const Spacer(),
      ],
    );
  }
}
