import 'package:flutter/material.dart';

class PinActivationSuccessScreen extends StatelessWidget {
  const PinActivationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Spacer(),
        Text("PIN activated!", style: TextStyle(fontSize: 26)),
        Spacer(),
        Image(
          image: AssetImage("assets/images/success_icon.png"),
          width: 130,
          height: 130,
        ),
        Spacer(),
        Spacer(),
      ],
    );
  }
}
