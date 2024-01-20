import 'package:flutter/material.dart';

class SmokeSignalScreen extends StatefulWidget {
  const SmokeSignalScreen({super.key});

  @override
  State<SmokeSignalScreen> createState() => _SmokeSignalScreenState();
}

class _SmokeSignalScreenState extends State<SmokeSignalScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text("Precautionary Signal",
            style: Theme.of(context).textTheme.headlineMedium),
        const Spacer(),
        const Spacer(),
        const Spacer(),
        const Text(
            "Specify Signal and \nkeep trigger pressed \nto set smokesign"),
        const Spacer(),
        ElevatedButton(
            onPressed: () {}, child: const Text("prepare smokesign")),
        const Spacer(),
        const Spacer(),
      ],
    );
  }
}
