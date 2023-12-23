import 'package:flutter/material.dart';

class RegistrationFailScreen extends StatelessWidget {
  const RegistrationFailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Spacer(),
        Text("Process failed!", style: TextStyle(fontSize: 26)),
        Spacer(),
        Image(
          image: AssetImage("assets/images/fail_icon.png"),
          width: 130,
          height: 130,
        ),
        Spacer(),
        Spacer(),
      ],
    );
  }
}
