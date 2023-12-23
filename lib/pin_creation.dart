import 'package:flutter/material.dart';

class PinCreationScreen extends StatelessWidget {
  const PinCreationScreen({super.key});

  final String hexColor = "#010536";

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Spacer(),
        FractionallySizedBox(
          widthFactor: 0.9,
          child: Text(
            "Create your PIN",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 25,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Spacer(),
        FractionallySizedBox(
          widthFactor: 0.9,
          child: TextField(
            decoration: InputDecoration(
              //  icon: Icon(Icons.person),
              labelText: "Your PIN",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: 45),
        FractionallySizedBox(
          widthFactor: 0.9,
          child: TextFormField(
            decoration: InputDecoration(
              //       icon: Icon(Icons.lock),
              //   hintText: "Your provided initial password",
              labelText: "Retipe your PIN",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Spacer(),
        FractionallySizedBox(
          widthFactor: 0.9,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Create PIN",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                hexToColor(hexColor),
              ),
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
