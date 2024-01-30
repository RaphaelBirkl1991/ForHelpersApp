import 'package:flutter/material.dart';

class PinSection extends StatefulWidget {
  const PinSection({super.key});

  @override
  State<PinSection> createState() => _PinSectionState();
}

class _PinSectionState extends State<PinSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "PIN",
          style: TextStyle(fontSize: 25),
        ),
        Row(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Retipe your PIN',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(int.parse("0xFF010536")),
              ),
              child: const Text('save', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }
}
