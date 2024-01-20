import 'package:flutter/material.dart';

class SettingsColumn extends StatefulWidget {
  const SettingsColumn({super.key});

  @override
  State<SettingsColumn> createState() => _SettingsColumnState();
}

class _SettingsColumnState extends State<SettingsColumn> {
  int _selectedValue = 0; // Variable für RadioButtons initialisieren

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        const Text(
          "Language",
          style: TextStyle(fontSize: 25),
        ),
        RadioListTile(
          title: const Text('English'),
          value: 1,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value as int;
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        RadioListTile(
          title: const Text('German'),
          value: 2, // Wert für den zweiten RadioButton ändern
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value as int;
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        RadioListTile(
          title: const Text('Bavarian'),
          value: 3, // Wert für den dritten RadioButton ändern
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value as int;
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        const Spacer(),
        const Text("Color Schemes", style: TextStyle(fontSize: 25)),
        RadioListTile(
          title: const Text('Default'),
          value: 4, // Wert für den vierten RadioButton ändern
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value as int;
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        RadioListTile(
          title: const Text('Darkmode'),
          value: 5, // Wert für den fünften RadioButton ändern
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value as int;
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        const Spacer(),
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
        const Spacer(),
      ],
    );
  }
}
