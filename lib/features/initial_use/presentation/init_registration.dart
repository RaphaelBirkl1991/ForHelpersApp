import 'package:flutter/material.dart';
import 'package:p12_basic_widgets/features/initial_use/presentation/init_registration_success.dart';

class InitRegistrationScreen extends StatelessWidget {
  const InitRegistrationScreen({super.key});

  final String hexColor = "#010536";

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 12, 12, 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const FractionallySizedBox(
              widthFactor: 0.9,
              child: Text(
                "Registration",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 25,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const Spacer(),
            const FractionallySizedBox(
              widthFactor: 0.9,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Idetification number",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Initial password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Spacer(),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const RegistrationSuccessScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    hexToColor(hexColor),
                  ),
                ),
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
