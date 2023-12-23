import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  final String hexColor = "#010536";

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Registration",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 25,
          ),
          textAlign: TextAlign.left,
        ),
        FractionallySizedBox(
          widthFactor: 0.9,
          child: TextField(
            decoration: InputDecoration(
              //  icon: Icon(Icons.person),
              labelText: "Idetification number",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        FractionallySizedBox(
          widthFactor: 0.9,
          child: TextFormField(
            decoration: InputDecoration(
              //       icon: Icon(Icons.lock),
              //   hintText: "Your provided initial password",
              labelText: "Initial password",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        FractionallySizedBox(
          widthFactor: 0.9,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Register",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                hexToColor(hexColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
