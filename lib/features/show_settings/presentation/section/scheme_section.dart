import 'package:flutter/material.dart';

class SchemeSection extends StatefulWidget {
  const SchemeSection({super.key});

  @override
  State<SchemeSection> createState() => _SchemeSection();
}

class _SchemeSection extends State<SchemeSection> {
  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Color Schemes", style: TextStyle(fontSize: 25)),
        RadioListTile(
          title: const Text('Default'),
          activeColor: Theme.of(context).primaryColor,
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
          title: const Text('Darkmode'),
          activeColor: Theme.of(context).primaryColor,
          value: 2,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value as int;
            });
          },
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () {},
              child: const Text("save"),
            ),
          ],
        ),
      ],
    );
  }
}
