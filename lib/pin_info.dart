import 'package:flutter/material.dart';

class PinInfoScreen extends StatelessWidget {
  const PinInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // Breite des Bildschirms
      padding: EdgeInsets.symmetric(
          horizontal: 20.0), // optional: horizontaler Innenabstand
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Text("Info",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal)),
          Spacer(),
          Text("Your PIN is a four- \ndigit number.",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal)),
          Spacer(),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}
