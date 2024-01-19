import 'package:flutter/material.dart';

class SettingsColumn extends StatefulWidget {
  const SettingsColumn({Key? key});

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
        Spacer(),
        Text(
          "Language",
          style: TextStyle(fontSize: 25),
        ),
        RadioListTile(
          title: Text('English'),
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
          title: Text('German'),
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
          title: Text('Bavarian'),
          value: 3, // Wert für den dritten RadioButton ändern
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value as int;
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        Spacer(),
        Text("Color Schemes", style: TextStyle(fontSize: 25)),
        RadioListTile(
          title: Text('Default'),
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
          title: Text('Darkmode'),
          value: 5, // Wert für den fünften RadioButton ändern
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value as int;
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        Spacer(),
        Text(
          "PIN",
          style: TextStyle(fontSize: 25),
        ),
        Row(
          children: [
            Expanded(
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
            SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('save', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(int.parse("0xFF010536")),
              ),
            ),
          ],
        ),
        Spacer(),
      ],
    );
  }
}
